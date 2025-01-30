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
                DDDButton("Button",
                          icon: .aquisito,
                          disclosureIcon: .anticuchos,
                          action: {
                    
                })
                
                
                DDDButton("Primary/Regular/Disabled",
                          icon: .aquisito,
                          disclosureIcon: .anticuchos,
                          action: {
                    
                }).disabled(true)
                
                DDDButton("Secondary/Regular/Default",
                          desing: .secondary,
                          icon: .aquisito,
                          disclosureIcon: .anticuchos,
                          action: {
                    
                })
                
                DDDButton("Secondary/Regular/Disabled",
                          desing: .secondary,
                          icon: .aquisito,
                          disclosureIcon: .anticuchos,
                          action: {
                    
                }).disabled(true)
                
                
                DDDButton("Tertiary/Regular/Default",
                          desing: .tertiary,
                          icon: .aquisito,
                          disclosureIcon: .anticuchos,
                          action: {
                    
                })
                
                
                HStack(spacing: 12) {
                    DDDButton(desing: .onlyIcon(inverted: false),
                              icon: .aquisito,
                              action: {
                        
                    })
                    DDDButton(desing: .onlyIcon(inverted: true),
                              icon: .aquisito,
                              action: {
                        
                    })
                }.frame(maxWidth: .infinity, alignment: .center)
                HStack(spacing: 12) {
                    DDDButton(desing: .onlyIcon(inverted: false),
                              icon: .aquisito,
                              action: {
                        
                    }).disabled(true)
                    DDDButton(desing: .onlyIcon(inverted: true),
                              icon: .aquisito,
                              action: {
                        
                    }).disabled(true)
                }.frame(maxWidth: .infinity, alignment: .center)

            }
        }
        .navigationTitle("Buttons")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    DDDButtonsDetail()
}
