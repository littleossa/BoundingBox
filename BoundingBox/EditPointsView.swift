//
//  EditingPointsView.swift
//  BoundingBox
//
//  Created by 平岡修 on 2022/04/08.
//

import SwiftUI

struct EditPointsView: View {
        
    var body: some View {
        
        VStack {
            HStack {
                EditPoint(dragOnChange: { _ in
                    print("onChange")
                }, dragOnEnded: { _ in
                    print("onEnded")
                })
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPoint(dragOnChange: { _ in
                    print("onChange")
                }, dragOnEnded: { _ in
                    print("onEnded")
                })
                
                Spacer()
                
                EditPoint(dragOnChange: { value in
                    if value.startLocation.equalTo(value.location) {
                        return
                    }
                    if value.startLocation.x < value.location.x {
                        print("x")
                    }
                    print("onChange")
                }, dragOnEnded: { _ in
                    print("onEnded")
                })
                .offset(x: 5, y: 0)
            }
            .offset(x: 0, y: -5)
            
            Spacer()
            
            HStack {
                EditPoint(dragOnChange: { _ in
                    print("onChange")
                }, dragOnEnded: { _ in
                    print("onEnded")
                })
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPoint(dragOnChange: { _ in
                    print("onChange")
                }, dragOnEnded: { _ in
                    print("onEnded")
                })
                .offset(x: 5, y: 0)
            }
            
            Spacer()
            
            HStack {
                EditPoint(dragOnChange: { _ in
                    print("onChange")
                }, dragOnEnded: { _ in
                    print("onEnded")
                })
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPoint(dragOnChange: { _ in
                    print("onChange")
                }, dragOnEnded: { _ in
                    print("onEnded")
                })
                
                Spacer()
                
                EditPoint(dragOnChange: { _ in
                    print("onChange")
                }, dragOnEnded: { _ in
                    print("onEnded")
                })
                .offset(x: 5, y: 0)
            }
            .offset(x: 0, y: 5)
        }
    }
}

struct EditingPointsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MovingDashFramedRectangle()
            EditPointsView()
        }
        .frame(width: 100, height: 100)
    }
}