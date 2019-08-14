//
//  HorizontalBar.swift
//
//  Created by Igor Malyarov on 05.08.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

public struct HorizontalBar: View {
    public var bar: CGFloat
    public var bars: [CGFloat]
    
    public var height: CGFloat = 9
    public var cornerRadius: CGFloat = 3
    
    public var colorMore: Color = .systemGreen
    public var colorLess: Color = .systemYellow
    
    public var fill: Bool = true
    
    public init(bar: CGFloat, bars: [CGFloat], height: CGFloat, cornerRadius: CGFloat, colorMore: Color, colorLess: Color, fill: Bool) {
        self.bar = bar
        self.bars = bars
        
        self.height = height
        self.cornerRadius = cornerRadius
        
        self.colorMore = colorMore
        self.colorLess = colorLess
        
        self.fill = fill
    }
    
    public init(bar: CGFloat, bars: [CGFloat], height: CGFloat, colorLess: Color, fill: Bool) {
        self.bar = bar
        self.bars = bars
        
        self.height = height
        self.cornerRadius = 3
        
        self.colorMore = .systemGreen
        self.colorLess = colorLess
        
        self.fill = fill
    }
    
    public init(bar: CGFloat, bars: [CGFloat], fill: Bool) {
        self.bar = bar
        self.bars = bars
        
        self.height = 9
        self.cornerRadius = 3
        
        self.colorMore = .systemGreen
        self.colorLess = .systemYellow
        
        self.fill = fill
    }
    
    public init(bar: CGFloat, bars: [CGFloat]) {
        self.bar = bar
        self.bars = bars
        
        self.height = 9
        self.cornerRadius = 3
        
        self.colorMore = .systemGreen
        self.colorLess = .systemYellow
        
        self.fill = true
    }
    
    var barsMax: CGFloat {
        bars.max() ?? 1
    }
    var barsTotal: CGFloat {
        bars.reduce(0.0, + )
    }
    var lessThenAverage: Bool {
        CGFloat(bar / barsTotal) < (CGFloat(1) / CGFloat(bars.count))
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                if self.fill {
                    RoundedRectangle(cornerRadius: self.cornerRadius, style: .continuous)
                        .frame(width: geometry.size.width,
                               height: self.height)
                        .foregroundColor(Color.gray)
                        .opacity(0.25)
                    
                } else {
                    RoundedRectangle(cornerRadius: self.cornerRadius, style: .continuous)
                        .frame(width: geometry.size.width,
                               height: self.height)
                        .foregroundColor(Color.clear)
                        .overlay(RoundedRectangle(cornerRadius: self.cornerRadius,
                                                  style: .continuous)
                            .stroke()
                            .foregroundColor(Color.gray)
                            .opacity(0.4)
                    )
                }
                
                RoundedRectangle(cornerRadius: self.cornerRadius, style: .continuous)
                    .frame(width: self.bar / self.barsTotal * geometry.size.width,
                           height: self.height)
                    .foregroundColor(self.lessThenAverage ? self.colorLess : self.colorMore)
            }
        }
        .frame(height: height)
        
    }
}

#if DEBUG
struct HorizontalBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HorizontalBar(bar: 55.0,
                          bars: [30.0, 70])
                .padding()
            
            HorizontalBar(bar: 45.0,
                          bars: [30,0, 70],
                          fill: false)
                .padding()
            
            HorizontalBar(bar: 45,
                          bars: [30, 70],
                          height: 32,
                          colorLess: .systemPurple,
                          fill: false)
                .padding()
        }
    }
}
#endif
