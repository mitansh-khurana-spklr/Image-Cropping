//
//  EditingSelectionView.swift
//  Project
//
//  Created by Mitansh Khurana on 24/06/22.
//

import SwiftUI

var showingEditingSelection = false
var cropState = false

struct EditingSelectionView: View {
    
    @Binding var uiImage: UIImage
    @Binding var imageToShow: UIImage
    @Binding var isCropped: Bool
    
    @State var isShowingCropView = false
    @State var isShowingFilterView = false
    @State var isShowingAdjustView = false
    
    
    var body: some View {
        ZStack {
            
            Color.black
                .edgesIgnoringSafeArea(.vertical)
            
            VStack {
                
                Spacer()
                
                // Current state of image
                Image(uiImage: imageToShow)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onAppear{
                        if cropState {
                            imageToShow = finalImageCropped
                        }
                        else {
                            imageToShow = uiImage
                        }
                    }
                    .padding()
                
                
                // Navigation to croppping page
                NavigationLink(destination: CroppingPage(uiImage: $uiImage, isCropped: $isCropped), isActive: $isShowingCropView) {
                    EmptyView()
                }
                
                // Navigation to filter page
                NavigationLink(destination: InbuiltFilterView(), isActive: $isShowingFilterView) {
                    EmptyView()
                }
                
                // Navigation to adjust page
                NavigationLink(destination: AdjustPage(), isActive: $isShowingAdjustView) {
                    EmptyView()
                }
                
                
                Spacer()
                
                
                // Buttons to select editing option
                HStack {
                    Button(action: {
                        isShowingCropView = true
                    }) {
                        VStack {
                            Image(systemName: "crop.rotate")
                                .foregroundColor(.white)
                                .font(.title2)
                                .padding(.horizontal)
                                .padding(.bottom, 2)
            
                            
                            Text("Crop")
                                .foregroundColor(.white)
                                .font(.body)
                                .opacity(0.8)
                        }
                    }
                    
                    Button(action: {
                        isShowingFilterView = true
                    }) {
                        VStack {
                            Image(systemName: "camera.filters")
                                .foregroundColor(.white)
                                .font(.title2)
                                .padding(.horizontal)
                                .padding(.bottom, 5)
                                .padding(.top, 1)
                            
                            
                            Text("Filters")
                                .foregroundColor(.white)
                                .font(.body)
                                .opacity(0.8)
                        }
                    }
                    
                    Button(action: {
                        isShowingAdjustView = true
                    }) {
                        VStack {
                            Image(systemName: "slider.vertical.3")
                                .foregroundColor(.white)
                                .font(.title2)
                                .padding(.horizontal)
                                .padding(.bottom, 6)
                                .padding(.top, 1)
                            
                            Text("Adjust")
                                .foregroundColor(.white)
                                .font(.body)
                                .opacity(0.8)
                        }
                    }
                    
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "drop")
                                .foregroundColor(.white)
                                .font(.title2)
                                .padding(.horizontal)
                                .padding(.bottom, 5)
                                .padding(.top, 1)
                            
                            Text("Focus")
                                .foregroundColor(.white)
                                .font(.body)
                                .opacity(0.8)
                        }
                    }
                    
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "camera.macro")
                                .foregroundColor(.white)
                                .font(.title2)
                                .padding(.horizontal)
                                .padding(.bottom, 5)
                            
                            
                            Text("Macro")
                                .foregroundColor(.white)
                                .font(.body)
                                .opacity(0.8)
                            
                        }
                    }
                    .onAppear{
                        rotationState = 0
                        showingEditingSelection = true
                    }
                }
            }
            
        }
    }
}


