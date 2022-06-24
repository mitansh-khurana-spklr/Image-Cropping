//
//  EditingSelectionView.swift
//  Project
//
//  Created by Mitansh Khurana on 24/06/22.
//

import SwiftUI

struct EditingSelectionView: View {
    
    @Binding var uiImage: UIImage
    @Binding var imageToShow: UIImage
    @Binding var isCropped: Bool
    
    
    var body: some View {
        ZStack {
            
            Color.black
                .edgesIgnoringSafeArea(.vertical)
            
            VStack {
                
                Spacer()
                
                Image(uiImage: imageToShow)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onAppear{
                        if isCropped {
                            imageToShow = finalImageCropped
                        }
                        else {
                            imageToShow = uiImage
                        }
                    }
                
                Spacer()
                
                HStack {
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "crop.rotate")
                                .foregroundColor(.white)
                                .font(.title2)
                                .padding()
            
                            
                            Text("Crop")
                                .foregroundColor(.white)
                                .font(.title3)
                        }
                    }
                    
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "camera.filters")
                                .foregroundColor(.white)
                                .font(.title2)
                                .padding()
                                .padding(.bottom, 9)
                            
                            
                            Text("Filters")
                                .foregroundColor(.white)
                                .font(.title3)
                        }
                    }
                    
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "slider.vertical.3")
                                .foregroundColor(.white)
                                .font(.title2)
                                .padding()
                                .padding(.bottom, 14)
                            
                            Text("Adjust")
                                .foregroundColor(.white)
                                .font(.title3)
                        }
                    }
                    
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "drop")
                                .foregroundColor(.white)
                                .font(.title2)
                                .padding()
                                .padding(.bottom, 9)
                            
                            Text("Focus")
                                .foregroundColor(.white)
                                .font(.title3)
                        }
                    }
                    
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "camera.macro")
                                .foregroundColor(.white)
                                .font(.title2)
                                .padding()
                                .padding(.bottom, 9)
                            
                            
                            Text("Macro")
                                .foregroundColor(.white)
                                .font(.title3)
                            
                        }
                    }
                    
                    
                    
                    
                }
            }
            
        }
    }
}

//struct EditingSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditingSelectionView()
//    }
//}
