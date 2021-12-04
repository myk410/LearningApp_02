//
//  ContentView.swift
//  LearningApp
//
//  Created by G. Michael Fortin Jr on 12/4/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView{
            
            LazyVStack{
                
                // Confirm that currentModule is set
                
                if model.currentModule != nil {
                
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        
                        NavigationLink(destination: ContentDetailView()
                                        .onAppear(perform: { model.beginLesson(index)}), label: {
                            ContentViewRow(index: index)
                        })
                        
                        
                
                }
                    
            }
            
        }
            .accentColor(.black)
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        
    }
    
}
}
