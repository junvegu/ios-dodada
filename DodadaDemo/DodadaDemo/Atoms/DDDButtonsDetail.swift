//
//  DDDButtonsDetail.swift
//  DodadaDemo
//
//  Created by Junior Quevedo Gutiérrez  on 31/03/24.
//

import SwiftUI
import Dodada
struct DDDButtonsDetail: View {
    var body: some View {
        VStack {
            List {
                Button("Primary/Regular/Default") {
                    
                }.d3StyleApply(design: .primary)
                Button("Primary/Regular/Disabled") {
                    
                }
                .d3StyleApply(design: .primary)
                .disabled(true)
                
                Button("Secondary/Regular/Default") {
                    
                }
                .d3StyleApply(design: .secondary)
                
                Button("Secondary/Regular/Disabled") {
                    
                }
                .d3StyleApply(design: .secondary)
                .disabled(true)
                
                Button("Akisito") {
                    print("TAPPPP")
                }.d3StyleApply(design: .primary)
            }
        }
        .navigationTitle("Buttons")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    DDDButtonsDetail()
}
