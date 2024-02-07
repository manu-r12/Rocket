//
//  DispatchWorkView.swift
//  Rocket
//
//  Created by Manu on 2024-02-01.
//

import SwiftUI

struct DispatchWorkView: View {
    @State var note: String = ""
    @State var isImporting: Bool = false
    @State var selectedDocument: String?
    @State var is_selectClassSheetPresented = false
    var body: some View {
        VStack{
            
            Text("Dispatch")
                .font(.custom("Poppins-Medium", size: 29))
                .padding(.top)
                .padding(.bottom,30)
            
            VStack{
                // file and image selection
                VStack(alignment: .leading,spacing: 60){
                    
                    HStack(spacing: 90){
                        Image(systemName: "doc.fill")
                            .font(.largeTitle)
                            .frame(width: 40)
                            .foregroundStyle(LinearGradient(colors: ButtonGradients.gradient_color_purpleToblue, startPoint: .leading, endPoint: .trailing))
                        Button(action: {
                            isImporting = true
                        }, label: {
                            Text("Select a file")
                                .font(.custom("Poppins-Regular", size: 19))
                                .foregroundStyle(.uniBlack)
                            
                        })
                    }
                    
                    HStack(spacing: 90){
                        Image(systemName: "photo.fill")
                            .font(.largeTitle)
                            .frame(width: 40)
                            .foregroundStyle(LinearGradient(colors: ButtonGradients.gradient_color_purpleToblue, startPoint: .leading, endPoint: .trailing))
                        
                        Button(action: {}, label: {
                            Text("Select an image")
                                .font(.custom("Poppins-Regular", size: 19))
                                .foregroundStyle(.uniBlack)
                            
                        })
                    }
                }
                
                //Note
                
                VStack(alignment:.leading){
                    Text("Note")
                    
                        .font(.custom("Poppins-Regular", size: 19))
                        .foregroundStyle(.uniBlack)
                    VStack {
                        TextEditor(text: $note)
                            .frame(height: 250)
                            .textEditorStyle(PlainTextEditorStyle())
                            .background(.thinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                    }
                }
                .padding()
                Button(action: {
                    withAnimation(.spring) {
                        is_selectClassSheetPresented = true
                    }
                }
                       , label: {
                    Text("Send")
                        .frame(width: 280, height: 55)
                        .font(.custom("Poppins-SemiBold", size: 19))
                        .foregroundStyle(.white)
                        .background(LinearGradient(gradient: ButtonGradients.buttonGradient_1, startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .trailing))
                        .clipShape(Capsule())
                })
            }
            
            Spacer()
        }
        .sheet(isPresented: $is_selectClassSheetPresented, content: {
            SelectClassView()
                .presentationBackground(.ultraThinMaterial)
                .presentationDetents([.height(500), .large])
        })
        .fileImporter(isPresented: $isImporting, allowedContentTypes: [.pdf]) { result in
            switch result {
            case .success(let url):
                print(url.absoluteString)
                selectedDocument = url.absoluteString
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

#Preview {
    DispatchWorkView()
}
