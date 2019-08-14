//
//  HorizontalBars.swift
//
//  Created by Igor Malyarov on 04.08.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI
//import SwiftExtensions

public struct HorizontalBars: View {
    public var bars: [CGFloat]
    public var color: Color = .systemBlue
    public var height: CGFloat = 8
    public var verticalSpacing: CGFloat = 2
    
    var barsMax: CGFloat {
        bars.max() ?? 1
    }
    var cornerRadius: CGFloat { height / 2 }
    
    public var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: self.verticalSpacing) {
                ForEach(self.bars, id: \.self) { bar in
                    RoundedRectangle(cornerRadius: self.cornerRadius, style: .continuous)
                        .frame(width: bar / self.barsMax * geometry.size.width,
                               height: self.height)
                        .foregroundColor(self.color)
                        .opacity(Double(bar / self.barsMax))
                }
            }
        }
        .frame(height: height * CGFloat(bars.count) + verticalSpacing * CGFloat(bars.count - 1))
    }
}

public struct HorizontalBars2: View {
    public var bars: [CGFloat]
    public var color: Color = .systemBlue

    public var height: CGFloat = 8
    
    public var barsTotal: CGFloat {
        bars.reduce(0.0, + )
    }
    public var cornerRadius: CGFloat { height / 2 }
    
    public var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center, spacing: 0) {
                ForEach(self.bars, id: \.self) { bar in
                    RoundedRectangle(cornerRadius: self.cornerRadius, style: .continuous)
                        .frame(width: bar / self.barsTotal * geometry.size.width,
                               height: self.height)
                        .foregroundColor(self.color)
                        .opacity(Double(bar / self.barsTotal))
                }
            }
        }
        .frame(height: height)
    }
}

struct HorizontalBars3: View {
    var bars: [CGFloat]
    var color: Color = .systemBlue
    var height: CGFloat = 8
    var verticalSpacing: CGFloat = 2
    
    var barsMax: CGFloat {
        bars.max() ?? 1
    }
    var barsTotal: CGFloat {
        bars.reduce(0.0, + )
    }
    var cornerRadius: CGFloat { height / 2 }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: self.verticalSpacing) {
                ForEach(self.bars, id: \.self) { bar in
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: self.cornerRadius, style: .continuous)
                            .frame(width: bar / self.barsTotal * geometry.size.width,
                                   height: self.height)
                            .foregroundColor(self.color)
                            .opacity(Double(bar / self.barsMax))
                        
                        RoundedRectangle(cornerRadius: self.cornerRadius, style: .continuous)
                            .frame(width: geometry.size.width,
                                   height: self.height)
                            .foregroundColor(Color.clear)
                            .overlay(RoundedRectangle(cornerRadius: self.cornerRadius,
                                                      style: .continuous)
                                .stroke()
                                .foregroundColor(Color.systemGray2)
                                .opacity(0.4)
                        )
                    }
                }
            }
        }
        .frame(height: height * CGFloat(bars.count) + verticalSpacing * CGFloat(bars.count - 1))
        
        //        .padding(.top, 10)
        //        .padding(.bottom)
    }
}

#if DEBUG
struct HorizontalBars_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HorizontalBars(bars: [30, 45, 25, 65])
                .padding()
//                .border(Color.pink)
            
            HorizontalBars2(bars: [30, 45, 25, 65],
                            color: .systemPink)
                .padding()
//                .border(Color.pink)
            
            HorizontalBars3(bars: [30, 45, 25, 65],
                            color: .systemTeal)
                .padding()
//                .border(Color.pink)
            
        }
    }
}
#endif
