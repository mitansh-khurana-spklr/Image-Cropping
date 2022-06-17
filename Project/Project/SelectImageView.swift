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
    @State var isShowingEditingView = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.black
                    .edgesIgnoringSafeArea(.vertical)
            
                VStack {
                    
                    NavigationLink(destination: CroppingPage(uiImage: $uiImage), isActive: $isShowingEditingView) {
//                        Text("Begin")
//                            .foregroundColor(.white)
//                            .font(.title)
//                            .frame(width: 100, height: 50)
//                            .background(.green)
//                            .cornerRadius(10)
                        EmptyView()
                            
                    }
                    
                    Button(action: {
                        isShowingEditingView = true
                    }, label: {
                        Text("Begin")
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(width: 100, height: 50)
                        .background(.green)
                        .cornerRadius(10)
                    })
                    
                    .padding()
                    .frame(width: 100, height: 100, alignment: .top)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            HStack {
                                    Text("Choose Image")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    }
                                }
                            }

                    
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
                    
                    if(isImageSelected == true){
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding([.horizontal])
                            .border(.white)
                    }
                    
                    
                    Spacer()
                    
                    Button(action: {
                        self.isShowPhotoLibrary = true
                        isImageSelected = true
                    }) {
                        HStack {
                            Image(systemName: "photo")
                                .font(.system(size: 20))

                            Text("Select Image")
                                .font(.headline)
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
            
            
            
        }
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $uiImage)
        }
        
    }
}

struct SelectImageView_Previews: PreviewProvider {
    static var previews: some View {
        SelectImageView()
    }
}
