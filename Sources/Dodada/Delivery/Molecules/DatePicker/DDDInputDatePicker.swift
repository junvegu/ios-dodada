//
//  DDDInputDatePicker.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 9/05/25.
//
import SwiftUI

public struct DDDInputDatePicker: View {
    @Binding var selectedDate: Date?
    let placeholder: String
    let description: String?
    let errorMessage: String?

    @Environment(\.isEnabled) private var isEnabled: Bool
    @State private var showDatePicker = false
    @State private var isFocused = false

    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ZStack(alignment: .leading) {
                if !placeholder.isEmpty && selectedDate != nil {
                    Text(placeholder)
                        .textStyle(.footnoteRegular)
                        .scaleEffect(1.0)
                        .opacity(1.0)
                        .offset(y: 0)
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .top).combined(with: .opacity),
                                removal: .scale(scale: 0.8).combined(with: .opacity)
                            )
                        )
                }
            }
            .animation(.easeInOut(duration: 0.2), value: selectedDate)
        
            Button {
                withAnimation {
                    showDatePicker = true
                    isFocused = true
                }
            } label: {
                HStack {
                    Text(selectedDate.map { formatDate($0) } ?? placeholder)
                        .foregroundColor(selectedDate == nil ? .gray : InputStyles.default.textColor)
                        .textStyle(.bodyRegular)

                    Spacer()

                    DDDIcon(.timeCalendar, color: .secondaryValue500)
                }
                .padding(.horizontal)
                .padding(.vertical, 12)
                .background(
                    (!isEnabled ? Color.secondaryValue200.opacity(0.4) : .white)
                        .animation(.easeInOut(duration: 0.2), value: isEnabled)
                )
                .cornerRadius(.radiusSm)
                .overlay(
                    RoundedRectangle(cornerRadius: .radiusSm)
                        .stroke(
                            isFocused ? InputStyles.focus.borderColor : InputStyles.default.borderColor,
                            lineWidth: isFocused ? 2.5 : 2
                        )
                        .animation(.easeInOut(duration: 0.2), value: isFocused)
                )
            }
            .disabled(!isEnabled)

            Group {
                if let error = errorMessage, !error.isEmpty {
                    Text(error)
                        .textStyle(.caption1Regular)
                        .foregroundColor(.red)
                        .transition(.opacity.combined(with: .move(edge: .top)))
                } else if let desc = description {
                    Text(desc)
                        .textStyle(.caption1Regular)
                        .foregroundColor(.black)
                        .transition(.opacity)
                }
            }
            .animation(.easeInOut(duration: 0.25), value: errorMessage)
        }
        .sheet(isPresented: $showDatePicker, onDismiss: {
            isFocused = false
        }) {
            DatePicker(
                "Selecciona una fecha",
                selection: Binding<Date>(
                    get: { selectedDate ?? Date() },
                    set: { selectedDate = $0 }
                ),
                displayedComponents: [.date]
            )
            .datePickerStyle(.wheel)
            .labelsHidden()
            .presentationDetents([.medium])
            .padding()
        }
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }

    public init(
        selectedDate: Binding<Date?>,
        placeholder: String = "Selecciona una fecha",
        description: String? = nil,
        errorMessage: String? = nil
    ) {
        self._selectedDate = selectedDate
        self.placeholder = placeholder
        self.description = description
        self.errorMessage = errorMessage
    }
}

#Preview("DDDInputDatePicker Example") {
    struct PreviewWrapper: View {
        @State private var birthDate: Date? = nil
        @State private var showError = false

        var body: some View {
            VStack(spacing: 24) {
                DDDInputDatePicker(
                    selectedDate: $birthDate,
                    placeholder: "Fecha de nacimiento",
                    description: "Tu fecha de nacimiento real",
                    errorMessage: showError && birthDate == nil ? "Este campo es obligatorio" : nil
                )

                Button("Validar") {
                    showError = true
                }

                Button("Reset") {
                    birthDate = nil
                    showError = false
                }
            }
            .padding()
        }
    }

    return PreviewWrapper()
}
