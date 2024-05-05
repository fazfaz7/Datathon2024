import SwiftUI
import Speech

class SpeechViewModel: NSObject, ObservableObject {
    
    @Published var recognizedText = ""
    var audioEngine = AVAudioEngine()
    var speechRecognizer: SFSpeechRecognizer?
    var request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    
    override init() {
        super.init()
        requestSpeechAuthorization()
    }
    
    func startRecording() {
        recognizedText = ""
        do {
            try startAudioSession()
            try startRecognition()
        } catch let error {
            print("Error starting recognition: \(error.localizedDescription)")
        }
    }
    
    func stopRecording() {
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        request.endAudio()
        recognitionTask?.cancel()
    }
    
    private func startRecognition() throws {
        recognitionTask = speechRecognizer?.recognitionTask(with: request, resultHandler: { (result, error) in
            if let result = result {
                let bestString = result.bestTranscription.formattedString
                DispatchQueue.main.async {
                    self.recognizedText = bestString
                }
            } else if let error = error {
                print("Recognition error: \(error.localizedDescription)")
            }
        })
    }
    
    private func startAudioSession() throws {
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
        try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        
        let inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.request.append(buffer)
        }
        
        audioEngine.prepare()
        try audioEngine.start()
    }
    
    private func requestSpeechAuthorization() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            switch authStatus {
            case .authorized:
                let italianLocale = Locale(identifier: "es_MX")
                self.speechRecognizer = SFSpeechRecognizer(locale: italianLocale)
            case .denied:
                print("User denied access to speech recognition")
            case .restricted:
                print("Speech recognition restricted on this device")
            case .notDetermined:
                print("Speech recognition not yet authorized")
            @unknown default:
                fatalError()
            }
        }
    }
}
