//
//  DDDToast.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 24/02/25.
//

import SwiftUI

public struct DDDToast: View {
    @Binding var isVisible: Bool
    
    var title: String
    var message: String?
    var type: AlertType

    @State private var animate: Bool = false  // Controls the animation state

    public init(
        title: String,
        message: String? = nil,
        type: AlertType,
        isVisible: Binding<Bool>
    ) {
        self.title = title
        self.message = message
        self.type = type
        self._isVisible = isVisible
    }
    
    public var body: some View {
        if isVisible {
            HStack(spacing: 10) {
                DDDIcon(type.leadingIcon)
                    .iconColor(type.iconColor)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .apply(token: .footNote, weight: .bold)
                    
                    if let message = message {
                        Text(message)
                            .apply(token: .footNote)
                    }
                }
                .foregroundColor(type.textColor)
                
                Spacer()
                
                Button(action: {
                    dismissToast()
                }) {
                    DDDIcon(.x)
                        .iconColor(type.iconColor)
                }
            }
            .padding()
            .background(type.backgroundColor)
            .cornerRadius(8)
            .padding(.horizontal)
            .opacity(animate ? 1 : 0)  // Fades in
            .offset(y: animate ? 0 : 30)  // Slides up
            .transition(.move(edge: .bottom).combined(with: .opacity))
            .onAppear {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                    animate = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    dismissToast()
                }
            }
        }
    }
    
    private func dismissToast() {
        withAnimation(.easeOut(duration: 0.3)) {
            animate = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {  // Wait for animation
            isVisible = false
        }
    }
}


struct ToastModifier: ViewModifier {
    @Binding var isVisible: Bool
    let title: String
    let message: String?
    let type: AlertType

    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isVisible {
                VStack {
                    Spacer()
                    DDDToast(
                        title: title,
                        message: message,
                        type: type,
                        isVisible: $isVisible
                    )
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .padding(.bottom, 50)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
        }
        .onAppear {
            if isVisible {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isVisible = false
                    }
                }
            }
        }
    }
}

// Extension for easy usage
extension View {
    func toast(
        isVisible: Binding<Bool>,
        title: String,
        message: String? = nil,
        type: AlertType
    ) -> some View {
        self.modifier(ToastModifier(isVisible: isVisible, title: title, message: message, type: type))
    }
}




#Preview {
    struct ToastPreview: View {
        @State private var isToastVisible = false

           var body: some View {
               VStack {
                   DDDButton("Show Toast") {
                       isToastVisible = true
                   }
               }
               .padding(60)
               .toast(
                isVisible: $isToastVisible,
                title: "Success",
                message: "Operation completed",
                type: .error
               )
           }
    }
    
    return ToastPreview()
}


