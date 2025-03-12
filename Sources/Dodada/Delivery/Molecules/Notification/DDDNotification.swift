//
//  DDDNotification.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 27/02/25.
//

import SwiftUI

public struct DDDNotification: View {
    @Binding var isVisible: Bool
    
    var title: String
    var description: String
    var type: NotificationType
    
    @State private var animate: Bool = false
    
     public init(
        title: String,
        description: String,
        type: NotificationType,
        isVisible: Binding<Bool>
    ) {
        self.title = title
        self.description = description
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
                    
                    Text(description)
                        .apply(token: .footNote)
                }
                .foregroundColor(type.textColor)
                
                Spacer()
            }
            .padding()
            .background(type.backgroundColor)
            .cornerRadius(8)
            .padding(.horizontal)
            .opacity(animate ? 1 : 0)
            .offset(y: animate ? 0 : -30)
            .transition(.move(edge: .top).combined(with: .opacity))
            .onAppear {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                    animate = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    dismissNotification()
                }
            }
        }
    }
    
    private func dismissNotification() {
        withAnimation(.easeOut(duration: 0.3)) {
            animate = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isVisible = false
        }
    }
}

public struct NotificationModifier: ViewModifier {
    @Binding var isVisible: Bool
    let title: String
    let description: String
    let type: NotificationType
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            
            if isVisible {
                VStack {
                    DDDNotification(
                        title: title,
                        description: description,
                        type: type,
                        isVisible: $isVisible
                    )
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .padding(.top, 50)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
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
public extension View {
    func notification(
        isVisible: Binding<Bool>,
        title: String,
        description: String,
        type: NotificationType
    ) -> some View {
        self.modifier(NotificationModifier(isVisible: isVisible, title: title, description: description, type: type))
    }
}

#Preview {
    struct NotificationPreview: View {
        @State private var isNotificationVisible = false

        var body: some View {
            VStack {
                DDDButton("Show Notification") {
                    isNotificationVisible = true
                }
            }
            .padding(60)
            .notification(
                isVisible: $isNotificationVisible,
                title: "Success",
                description: "Operation completed",
                type: .state5
            )
        }
    }
    
    return NotificationPreview()
}
