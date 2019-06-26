#include <utils/ProgramOptions.hpp>
#include <N2D2.hpp>
#include <DeepNet.hpp>
#include <StimuliProvider.hpp>
#include <Target/TargetScore.hpp>
#include <Generator/DeepNetGenerator.hpp>

#if defined(WIN32) || defined(_WIN32)
    #include <windows.h>
#endif

#ifdef CUDA
    #include <CudaContext.hpp>
#endif


using namespace N2D2;

#define TOPN 1


int main(int argc, char* argv[])
{
    // Program command line options
    ProgramOptions opts(argc, argv);
#ifdef CUDA
    const int cudaDevice
        = opts.parse("-dev", 0,              "CUDA device ID");
#endif
    const std::string pictureFileName
        = opts.parse<std::string>("-picture",
                                  "",
                                  "test the network on a specific picture");
    const std::string directoryName
        = opts.parse<std::string>("-dir",
                                  ".",
                                  "test the network on a specfic picture folder");
    
    const std::string imgFormat
        = opts.parse<std::string>("-format",
                                  "png",
                                  "format of files to be read in the specified directory");

    const std::string importedWeights
        = opts.parse<std::string>("-w",
                                  "",
                                  "import specific weight");
    const std::string iniConfig
        = opts.grab<std::string>("<net>",
                                 "network config file (INI)");
    opts.done();

#ifdef CUDA
    CudaContext::setDevice(cudaDevice);

    cudaDeviceProp prop;
    cudaGetDeviceProperties(&prop, cudaDevice);
    //timingsWindow+= std::string(" on ") + prop.name;
#endif

    //Network Initialisation
    Network net;
    std::shared_ptr<DeepNet> deepNet
        = DeepNetGenerator::generate(net, iniConfig);

    deepNet->initialize();

    if(!importedWeights.empty())
        deepNet->importNetworkFreeParameters(importedWeights);
    else
        deepNet->importNetworkFreeParameters("weights_validation");


    cv::Mat img;
    std::vector<cv::String> fn;
    std::vector<cv::Mat> images;
    std::fstream labelsFileSaved;
    labelsFileSaved.open("output_labels.out",
                                 std::fstream::out);

    // Read input
    if(!pictureFileName.empty()) {
        std::cout << "Reading from file " << pictureFileName << std::endl;
        images.push_back(cv::imread(pictureFileName));
        fn.push_back(pictureFileName);
    }

    
    if(!directoryName.empty()) {
        std::cout << "Reading from directory " << directoryName << std::endl;
        cv::glob(directoryName +"/*." + imgFormat, fn, false); // false - non recursive

        size_t count = fn.size(); //number of imgFormat files in images folder
        for (size_t i=0; i<count; i++) {
            images.push_back(cv::imread(fn[i]));
        }
    }

    while(!images.empty())
    {
        std::chrono::high_resolution_clock::time_point startTime
            = std::chrono::high_resolution_clock::now();

        img = images.back();
        images.pop_back();

        if (!img.data)
            continue;

        deepNet
             ->getStimuliProvider()
                 ->streamStimulus(img, Database::Test);

        deepNet->test(Database::Test);

        std::shared_ptr<TargetScore> targetPicture
            = deepNet->getTarget<TargetScore>();

        const Tensor<int> estimatedLabel
            = targetPicture->getEstimatedLabels()[0];
        const Tensor<Float_T> estimatedLabelValue
            = targetPicture->getEstimatedLabelsValue()[0];

        std::chrono::high_resolution_clock::time_point curTime
            = std::chrono::high_resolution_clock::now();

        
        const double timeElapsed
            = std::chrono::duration_cast<std::chrono::duration<double> >
                (curTime - startTime).count();

        std::stringstream labels_save;
        for (unsigned int i = 0, size = TOPN; i < size; ++i) {
            std::string displayEstimatedName
            = deepNet->getDatabase()->getLabelName(estimatedLabel(i));


            //double displayEstimatedValue = estimatedLabelValue(i);
            cv::String filename = fn.back();
            fn.pop_back();
            labels_save << filename
                << ": "
                << displayEstimatedName
                << "\n";            
        }
        labelsFileSaved << labels_save.str();
        std::cout << labels_save.str() << " @ " << timeElapsed << std::endl;
    }

    labelsFileSaved.close();
    std::cout << "Terminating..." << std::endl;
    return 0;
}
