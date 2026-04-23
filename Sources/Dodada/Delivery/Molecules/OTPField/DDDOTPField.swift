import SwiftUI

public struct DDDOTPField: View {
    @Binding public var code: String
    public let length: Int

    @FocusState private var isFieldFocused: Bool

    public init(_ code: Binding<String>, length: Int = 6) {
        self._code = code
        self.length = length
    }

    private var digits: [String] {
        let chars = Array(code)
        return (0..<length).map { index in
            index < chars.count ? String(chars[index]) : ""
        }
    }

    public var body: some View {
        HStack(spacing: 12) {
            ForEach(0..<length, id: \.self) { index in
                digitBox(at: index)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture { isFieldFocused = true }
        .overlay {
            TextField("", text: Binding(
                get: { code },
                set: { new in
                    code = String(new.filter { $0.isNumber }.prefix(length))
                }
            ))
            .keyboardType(.numberPad)
            .textContentType(.oneTimeCode)
            .focused($isFieldFocused)
            .opacity(0.001)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear { isFieldFocused = true }
    }

    @ViewBuilder
    private func digitBox(at index: Int) -> some View {
        let chars = Array(code)
        let hasDigit = index < chars.count
        let digit = hasDigit ? String(chars[index]) : "0"
        let isCurrent = isFieldFocused && index == min(chars.count, length - 1)

        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
            RoundedRectangle(cornerRadius: 8)
                .stroke(
                    isCurrent ? Color.primaryValue500 : Color.secondaryValue200,
                    lineWidth: isCurrent ? 2 : 1.5
                )
            Text(digit)
                .textStyle(.title2Bold)
                .foregroundColor(hasDigit ? Color.secondaryValue900 : Color.secondaryValue300)
        }
        .frame(width: 44, height: 52)
        .animation(.easeInOut(duration: 0.15), value: isCurrent)
    }
}

