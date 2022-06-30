//
//  SelectImageView.swift
//  Project
//
//  Created by Mitansh Khurana on 17/06/22.
//

import SwiftUI

struct SelectImageView: View {
    
    @State private var isShowPhotoLibrary = false
    @State var uiImage = UIImage()
    @State var isImageSelected = false
    @State var imageToShow = UIImage()
    @State var isCropped = false
    @State var isShowingEditingSelection = false
    @EnvironmentObject var rotateHelper: RotateHelper
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.black
                    .edgesIgnoringSafeArea(.vertical)
            
                VStack {
                    

                    // Navigation to editing selection
                    NavigationLink(destination: EditingSelectionView(uiImage: $uiImage, imageToShow: $imageToShow, isCropped: $isCropped), isActive: $isShowingEditingSelection) {
                        EmptyView()
                    }
                    

                    .padding()
                    .frame(width: 100, height: 100, alignment: .top)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            HStack {
                                    Text("")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    }
                                }
                            }

                    
                    // Displaying box if image not selected
                    if(isImageSelected == false){
                        ZStack {
                            Rectangle()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color(red: 0.118, green: 0.118, blue: 0.118, opacity: 1.0))
                            
                            Rectangle()
                                .strokeBorder( style: StrokeStyle(lineWidth: 3, dash: [10]))
                                .foregroundColor(.white)
                            .aspectRatio(contentMode: .fit)
                            
                            Text("Choose an image to begin")
                                .foregroundColor(.white)
                                .font(.title2)
                        }
                        .padding()
                    }
                    
                    // Displaying image if selected
                    if(isImageSelected == true){
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding([.horizontal])
                            .frame(width: min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height/2), height: min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height/2))
                    }
                    
                    
                    
                    Spacer()
                        .onAppear{
                            firstLoad = true
                            firstFullLoad = true
                            cropState = false
                            rotateHelper.rotateByAngle = 0
                            prevPrintValue = 0
                            flipState = false
                        }
                    
                    
                    // Button to open image gallery
                    Button(action: {
                        self.isShowPhotoLibrary = true
//                        isImageSelected = true
                    }) {
                        HStack {
                            Image(systemName: "photo")
                                .font(.system(size: 20))
                            
                            if isImageSelected {
                                Text("Change Image")
                                    .font(.headline)
                            }
                            else {
                                Text("Select Image")
                                    .font(.headline)
                            }
                            
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding(.horizontal)
                    }
                }
            }
            .background(.black)
            .foregroundColor(.black)
            .navigationBarItems(
               trailing:
                   Button(action: {
                       isShowingEditingSelection = true
                   }) {
                       
                       if isImageSelected {
                           HStack {
                               Text("Edit")
                                   .foregroundColor(.white)
                                   .font(.headline)
                               
                               Image(systemName: "chevron.right")
                                   .foregroundColor(.white)
                                   .font(.headline)
            
                           }
                       }
                   }
            )
            
            
            
        }
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $uiImage, imageToShow: $imageToShow, isImageSelected: $isImageSelected)
        }
        
    }
}

//struct SelectImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectImageView()
//    }
//}
