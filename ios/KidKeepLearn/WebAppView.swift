import SwiftUI
import WebKit

struct WebAppView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.websiteDataStore = .default()
        config.allowsInlineMediaPlayback = true
        let web = WKWebView(frame: .zero, configuration: config)
        web.navigationDelegate = context.coordinator
        web.uiDelegate = context.coordinator
        web.scrollView.contentInsetAdjustmentBehavior = .automatic
        web.isOpaque = false
        web.backgroundColor = .systemBackground

        if let index = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "Web") {
            let root = index.deletingLastPathComponent()
            web.loadFileURL(index, allowingReadAccessTo: root)
        }
        return web
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    final class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate {
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let url = navigationAction.request.url, let scheme = url.scheme, !["file","https","http","about"].contains(scheme) {
                UIApplication.shared.open(url)
                decisionHandler(.cancel)
                return
            }
            decisionHandler(.allow)
        }
    }
}
