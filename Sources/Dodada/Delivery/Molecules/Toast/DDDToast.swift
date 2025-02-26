//
//  DDDToast.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 24/02/25.
//

import SwiftUI

public struct DDDToast<LeadingIcon: View, TrailingIcon: View>: View {

    @State var isVisible : Bool = true
    
    var title: String?
    var message: String?
    var type: AlertType
    var showTrailingIcon: Bool
    var leadingIcon: () -> LeadingIcon
    var trailingIcon: () -> TrailingIcon

    public init(
        title: String? = nil,
        message: String? = nil,
        type: AlertType,
        showTrailingIcon: Bool = true,
        @ViewBuilder leadingIcon: @escaping () -> LeadingIcon = { EmptyView() },
        @ViewBuilder trailingIcon: @escaping () -> TrailingIcon = { EmptyView() }
    ) {
        self.title = title
        self.message = message
        self.type = type
        self.showTrailingIcon = showTrailingIcon
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
    }

    public var body: some View {
        if isVisible {
            HStack(spacing: 10) {
                
                DDDIcon(type.leadingIcon)
                    .iconColor(type.iconColor)
                
                VStack(alignment: .leading){
                    if let title = title{
                        Text(title)
                            .apply(token: .footNote,
                                   weight: .bold)
                    }
                    if let message = message {
                        Text(message)
                            .apply(token: .footNote)
                    }
                }.foregroundColor(type.textColor)
                
                Spacer()
                
                if showTrailingIcon{
                    Button(action: {
                        isVisible = false
                    }) {
                        DDDIcon(.x)
                            .iconColor(type.iconColor)
                    }
                }
            }
            .padding()
            .background(type.backgroundColor)
            .cornerRadius(8)
            .padding(.horizontal)
        }
    }
    
    
}

#Preview {
    VStack(spacing: 10) {
        //Toast
        Text("Toast")
            .bold()
        DDDToast(title: "Success", type: .success)
        DDDToast(title: "Warning", type: .warning)
        DDDToast(title: "Error", type: .error)
        DDDToast(title: "Info",type: .info)
        //Notification
        Text("Notification")
            .bold()
        DDDToast(title: "Succes", message: "Message...", type: .success, showTrailingIcon: false)
        DDDToast(title: "Warning", message: "Message...", type: .warning, showTrailingIcon: false)
        DDDToast(title: "Error",message: "Message...", type: .error, showTrailingIcon: false)
        DDDToast(title: "Info",message: "Message...", type: .info, showTrailingIcon: false)
        DDDToast(title: "State5",message: "Message...", type: .state5, showTrailingIcon: false)
    }
}

