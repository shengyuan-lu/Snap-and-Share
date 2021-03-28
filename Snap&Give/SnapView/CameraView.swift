import SwiftUI
import UIKit
import AVFoundation

struct CameraView: View {
    
    @StateObject var cameraModel = CameraModel()
    
    @State private var cornerRadius:CGFloat = 20
    
    @State private var object:String = ""
    
    @State private var MLModel = MobileNetV2()
    
    @State private var classificationLabel:String = ""
    
    var body: some View{
        
        ZStack {
            
            CameraLiveView(cameraModel: cameraModel)
                .edgesIgnoringSafeArea(.horizontal)
            
            VStack {
                
                if cameraModel.isTaken {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            cameraModel.retake()
                        },
                        label: {
                            Image(systemName: "arrow.counterclockwise.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                                .padding()
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        })
                        
                    }
                }
                
                Spacer()
                
                HStack {
                    
                    if cameraModel.isTaken {
                        
                        // Recognize Button
                        Button(
                            action: {
                                
                                let image = cameraModel.imageToSave
                                
                                let resizedImage = image?.resizeTo(size: CGSize(width: 224, height: 224))
                                
                                let buffer = resizedImage?.toBuffer()
                            
                                let output = try? MLModel.prediction(image: buffer!)
                                
                                if let output = output {
                                    self.classificationLabel = output.classLabel
                                    
                                    print(self.classificationLabel)
                                }

                                
                            },
                            label: {
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                    
                                    Text("Recognize")
                                        .fontWeight(.bold)
                                    
                                }
                                .font(.title)
                                .foregroundColor(.black)
                                .padding(.vertical, 20)
                                .padding(.horizontal, 20)
                                .background(Color.white)
                                .clipShape(Capsule())
                                .offset(y: -50)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                
                            })
                            .padding(.leading)
                        
                    } else {
                        
                        // Take Pic Button
                        
                        Button(
                            action: {
                                cameraModel.takePic()
                            },
                            label: {
                                
                                ZStack{
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 65, height: 65)
                                    
                                    Circle()
                                        .stroke(Color.white,lineWidth: 5)
                                        .frame(width: 80, height: 80)
                                }
                                .offset(y: -50)
                                .padding()
                            })
                        
                    }
                }
                .frame(height: 75)
            }
            
            RoundedRectangle(cornerRadius: self.cornerRadius)
                .stroke(Color.green, lineWidth: 10)
                .frame(width: UIScreen.main.bounds.size.width/1.5, height: UIScreen.main.bounds.size.width/1.5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .offset(y: -10.0)
            
        }
        .onAppear(perform: {
            cameraModel.check()
        })
        .alert(isPresented: $cameraModel.alert) {
            Alert(title: Text("Please Enable Camera Access"))
        }
    }
}


