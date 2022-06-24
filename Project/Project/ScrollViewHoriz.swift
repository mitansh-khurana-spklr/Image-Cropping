//
//  ScrollViewHoriz.swift
//  Project
//
//  Created by Mitansh Khurana on 24/06/22.
//




import SwiftUI


var printValue: CGFloat = 0
var prevPrintValue: CGFloat = 0

struct ScrollViewHoriz: View {
//    @Binding var offset: CGPoint 
    @Binding var offsetCheck: CGFloat
    @Binding var offset: CGPoint
//    @Binding var printValue: CGFloat
    @EnvironmentObject var rotateHelper: RotateHelper

        var body: some View {
//            Text("Hi")
            VStack {
                
                
//                Text ("\(Int((printValue*45)/(1184/2)))")
                
                
                
                
                
                GeometryReader { geo in
                    ZStack {
                        UIScrollViewWrapper(offset: $offset, offsetCheck: $offsetCheck) { //
                            HStack {
                                ForEach(-60...60, id: \.self) { text in
                                    if text >= -45 && text <= 45 {
                                        Text(".")
                                            .foregroundColor(.white)
//                                            .fontWeight(.bold)
                                            .font(.title)
//                                            .padding(.horizontal)
      
                                    }
                                    else{
                                        Text("")
                                    }
                                        
                                }
                            }
                            .background(.black)
                        }
                        
                        ZStack {
                            
                            Rectangle()
                                .background(.black)
                                .foregroundColor(.black)
                                .frame(width: 50, height: 30)
                            
                            HStack {
                                Text("\(Int(rotateHelper.rotateByAngle))")
                                    .foregroundColor(.white)
                                    .background(.black)
                                    .font(.title2)
                                .frame(height: 30)
                                
                                Image(systemName: "circle")
                                    .font(.system(size: 7))
                                    .foregroundColor(.white)
                                    .offset(x: -3, y: -5)
                            }
                            
                            
                            
                        }
                        .allowsHitTesting(false)
                    }
                }
                .frame(width: 250, height: 50, alignment: .center)
                .background(.black)
                
                
                HStack {
                    Text(offset.debugDescription)
                }
                .frame(width: 0, height: 0)
               
                 
            }
//            .background(.black)
        }
}

//struct ScrollViewHoriz_Previews: PreviewProvider {
//    static var previews: some View {
//        ScrollViewHoriz()
//    }
//}






class UIScrollViewViewController: UIViewController {
    lazy var scrollView: UIScrollView = {
        let v = UIScrollView()
        v.isPagingEnabled = false
        v.alwaysBounceHorizontal = true
        v.showsHorizontalScrollIndicator = false
        v.showsVerticalScrollIndicator = false
//        v.isDirectionalLockEnabled = true
        return v
    }()

    var hostingController: UIHostingController<AnyView> = UIHostingController(rootView: AnyView(EmptyView()))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        pinEdges(of: scrollView, to: view)

        hostingController.willMove(toParent: self)
        scrollView.addSubview(hostingController.view)
        pinEdges(of: hostingController.view, to: scrollView)
        hostingController.didMove(toParent: self)
    }

    func pinEdges(of viewA: UIView, to viewB: UIView) {
        viewA.translatesAutoresizingMaskIntoConstraints = false
        viewB.addConstraints([
            viewA.leadingAnchor.constraint(equalTo: viewB.leadingAnchor),
            viewA.trailingAnchor.constraint(equalTo: viewB.trailingAnchor),
            viewA.topAnchor.constraint(equalTo: viewB.topAnchor),
            viewA.bottomAnchor.constraint(equalTo: viewB.bottomAnchor),
        ])
    }
}

struct UIScrollViewWrapper<Content: View>: UIViewControllerRepresentable {
    var content: () -> Content
    @Binding var offset: CGPoint
    @Binding var offsetCheck: CGFloat
    init(offset: Binding<CGPoint>, offsetCheck: Binding<CGFloat>, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        _offset = offset
        _offsetCheck = offsetCheck
    }

    func makeCoordinator() -> Controller {
        return Controller(parent: self)
    }

    func makeUIViewController(context: Context) -> UIScrollViewViewController {
        let vc = UIScrollViewViewController()
        vc.scrollView.contentInsetAdjustmentBehavior = .never
        vc.hostingController.rootView = AnyView(content())
        vc.view.layoutIfNeeded()
//        vc.hostingController.rootView.width
        vc.scrollView.contentOffset = offset
        vc.scrollView.delegate = context.coordinator
        return vc
    }

    func updateUIViewController(_ viewController: UIScrollViewViewController, context: Context) {
        viewController.hostingController.rootView = AnyView(content())
        viewController.scrollView.contentOffset = offset
    }

    class Controller: NSObject, UIScrollViewDelegate {
        var parent: UIScrollViewWrapper<Content>
        init(parent: UIScrollViewWrapper<Content>) {
            self.parent = parent
        }

        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            parent.offset = scrollView.contentOffset
            printValue = parent.offset.x - 1317/2
            parent.offsetCheck = printValue
        
        }
    }
}



//class PrintValueHelper {
//    @Published var printValue: CGFloat = 0
//}

