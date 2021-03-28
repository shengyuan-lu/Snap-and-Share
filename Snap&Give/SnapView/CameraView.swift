import SwiftUI
import UIKit
import AVFoundation

struct CameraView: View {
    
    @ObservedObject var cameraModel:CameraModel
    
    @State private var cornerRadius:CGFloat = 20
    
    @State private var object:String = ""
    
    @State private var MLModel = Food101()
    
    let mlImageSize = CGSize(width: 299, height: 299)
    
    @State private var classificationLabel:String = ""
    
    var body: some View{
        
        ZStack {
            
            CameraLiveView(cameraModel: cameraModel)
            
            HStack {
                
                if cameraModel.isTaken {
                    
                    VStack {
                        
                        Spacer()
                        
                        HStack {
                            // Recognize Button
                            Button(
                                action: {
                                    DispatchQueue.global(qos: .background).async {
                                        
                                        guard let image = cameraModel.imageToSave else {
                                            print("There's no image saved")
                                            return
                                        }
                                        
                                        let resizedImage = image.resizeTo(size: mlImageSize)
                                        
                                        guard let buffer = resizedImage.toBuffer() else {
                                            print("Convert Image to Buffer Failed")
                                            return
                                        }
                                        
                                        let output = try? MLModel.prediction(image: buffer)
                                        
                                        DispatchQueue.main.async {
                                            if let output = output {
                                                self.classificationLabel = output.classLabel
                                            }
                                        }
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
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    
                                })
                                .padding(.horizontal)
                            
                            // Retake Button
                            Button(action: {
                                cameraModel.retake()
                                
                                self.classificationLabel = ""
                            },
                            label: {
                                Image(systemName: "arrow.counterclockwise.circle.fill")
                                    .font(.system(size: 70))
                                    .foregroundColor(.white)
                                    .padding()
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            })
                            
                        }
                        
                    }
                    
                    
                    
                    
                } else {
                    // Take Pic Button
                    VStack {
                        Spacer()
                        Button(
                            action: {
                                cameraModel.takePicture()
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
                                .offset(y: -10)
                                .padding()
                            })
                    }
                }
            }
            
            RoundedRectangle(cornerRadius: self.cornerRadius)
                .stroke(Color.green, lineWidth: 10)
                .frame(width: UIScreen.main.bounds.size.width/1.5, height: UIScreen.main.bounds.size.width/1.5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .offset(y: 20)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            Text(self.classificationLabel)
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.white)
                .offset(y: 20)
                .padding()
        }
        
        .onAppear(perform: {
            cameraModel.check()
        })
        .alert(isPresented: $cameraModel.alert) {
            Alert(title: Text("Please Enable Camera Access"))
        }
    }
    
    
}
