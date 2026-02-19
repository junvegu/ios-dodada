//
//  InternalWebView.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 12/01/26.
//

import SwiftUI
import WebKit

public struct InternalWebView: View {
    let url: URL
    @Binding var isPresented: Bool
    @State private var isLoading = true
    @State private var error: Error?
    
    public init(url: URL, isPresented: Binding<Bool>) {
        self.url = url
        self._isPresented = isPresented
    }
    
    public var body: some View {
        NavigationView {
            ZStack {
                WebViewRepresentable(
                    url: url,
                    isLoading: $isLoading,
                    error: $error
                )
                
                if isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                }
                
                if let error = error {
                    VStack(spacing: .spacingMd) {
                        Text("Error al cargar el menú")
                            .textStyle(.headlineBold)
                        Text(error.localizedDescription)
                            .textStyle(.bodyRegular)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                        
                        Button {
                            self.error = nil
                            self.isLoading = true
                        } label: {
                            Text("Reintentar")
                                .textStyle(.bodyBold)
                                .foregroundColor(.white)
                                .padding(.horizontal, .spacingLg)
                                .padding(.vertical, .spacingMd)
                                .background(Color.primaryValue500)
                                .cornerRadius(.radiusSm)
                        }
                    }
                    .padding(.spacingLg)
                }
            }
            .navigationTitle("Menú")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresented = false
                    } label: {
                        DDDIcon(.actionsClose)
                    }
                }
            }
        }
    }
}

private struct WebViewRepresentable: UIViewRepresentable {
    let url: URL
    @Binding var isLoading: Bool
    @Binding var error: Error?
    
    // Configuración optimizada de WKWebView (se crea una sola vez)
    private static let webViewConfiguration: WKWebViewConfiguration = {
        let config = WKWebViewConfiguration()
        
        // Optimizaciones de rendimiento
        config.processPool = WKProcessPool()
        
        // Preferencias para mejorar rendimiento
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        config.defaultWebpagePreferences = preferences
        
        // Configuración de datos
        let dataStore = WKWebsiteDataStore.default()
        config.websiteDataStore = dataStore
        
        return config
    }()
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView(frame: .zero, configuration: Self.webViewConfiguration)
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        
        // Optimizaciones adicionales
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.isOpaque = false
        webView.backgroundColor = .clear
        
        // Cargar la URL solo una vez al crear la vista
        let request = URLRequest(url: url)
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        // No recargar si la URL ya está cargada para evitar bloqueos
        if let currentURL = webView.url, currentURL == url {
            return
        }
        
        // Solo recargar si la URL cambió
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(isLoading: $isLoading, error: $error)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        @Binding var isLoading: Bool
        @Binding var error: Error?
        
        init(isLoading: Binding<Bool>, error: Binding<Error?>) {
            _isLoading = isLoading
            _error = error
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            DispatchQueue.main.async {
                self.isLoading = true
                self.error = nil
            }
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            DispatchQueue.main.async {
                self.isLoading = false
                self.error = error
            }
        }
        
        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            DispatchQueue.main.async {
                self.isLoading = false
                self.error = error
            }
        }
    }
}

#if PREVIEW
struct InternalWebView_Previews: PreviewProvider {
    static var previews: some View {
        InternalWebView(
            url: URL(string: "https://example.com")!,
            isPresented: .constant(true)
        )
    }
}
#endif
