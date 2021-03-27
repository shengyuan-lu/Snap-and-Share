import SwiftUI
import UIKit
import AVFoundation

struct CameraView: View {
    
    @StateObject var cameraModel = CameraModel()
    
    var body: some View{
        
        ZStack {
            
            CameraLiveView(camera: cameraModel)
                .edgesIgnoringSafeArea(.horizontal)
            
            VStack{
                
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
                                if !cameraModel.isRecognized {
                                    
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
                                .padding(.vertical,10)
                                .padding(.horizontal,20)
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
        }
        .onAppear(perform: {
            cameraModel.check()
        })
        .alert(isPresented: $cameraModel.alert) {
            Alert(title: Text("Please Enable Camera Access"))
        }
    }
}


