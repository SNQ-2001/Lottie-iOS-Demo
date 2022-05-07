//
//  LottieView.swift
//  Lottie-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/07.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var name: String
    var animationView = AnimationView()
    // ダークモード検知
    @Environment(\.colorScheme) var colorScheme
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.logHierarchyKeypaths()

        // ライトモード時のLittieの色
        let lightmode = Color(r: 0, g: 0, b: 0, a: 1)
        // ダークモード時のLittieの色
        let darkmode = Color(r: 1, g: 1, b: 1, a: 1)
        // 色をセットする
        let ColorValueProvider = ColorValueProvider(colorScheme == .dark ? darkmode : lightmode)
        // パスを取得
        let strokePath = AnimationKeypath(keypath: "BG.Stroke 1.Color")
        let logoPath = AnimationKeypath(keypath: "logo.Group 1.Fill 1.Color")
        // 色を適用
        animationView.setValueProvider(ColorValueProvider, keypath: strokePath)
        animationView.setValueProvider(ColorValueProvider, keypath: logoPath)

        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
    }
}
