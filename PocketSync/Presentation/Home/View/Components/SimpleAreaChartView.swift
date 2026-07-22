//
//  SimpleAreaChartView.swift
//  PocketSync
//
//  Created by Bibek upreti on 22/07/2026.
//

import SwiftUI

struct Point: Identifiable {
    let id = UUID()
    let x: Double
    let y: Double
}

let samplePoints: [Point] = [
    .init(x: 0, y: 10),
    .init(x: 1, y: 12),
    .init(x: 2, y: 8),
    .init(x: 3, y: 18),
    .init(x: 4, y: 15),
    .init(x: 5, y: 26),
]

struct SmoothLineChartShape: Shape {
    let points: [Point]
    
    func path(in rect: CGRect) -> Path {
        guard points.count > 1 else { return Path() }
        
        // Normalize points to rect
        let xs = points.map { $0.x }
        let ys = points.map { $0.y }
        guard let minX = xs.min(), let maxX = xs.max(),
              let minY = ys.min(), let maxY = ys.max(),
              maxX > minX, maxY > minY else {
            return Path()
        }
        
        func transform(_ p: Point) -> CGPoint {
            let xRatio = (p.x - minX) / (maxX - minX)
            let yRatio = (p.y - minY) / (maxY - minY)
            let x = rect.minX + CGFloat(xRatio) * rect.width
            let y = rect.maxY - CGFloat(yRatio) * rect.height
            return CGPoint(x: x, y: y)
        }
        
        let cgPoints = points.map(transform)
        
        var path = Path()
        path.move(to: cgPoints[0])
        
        // Simple smoothing using quadratic curves between midpoints
        for i in 1..<cgPoints.count {
            let p0 = cgPoints[i - 1]
            let p1 = cgPoints[i]
            let mid = CGPoint(x: (p0.x + p1.x) / 2, y: (p0.y + p1.y) / 2)
            path.addQuadCurve(to: mid, control: p0)
            path.addQuadCurve(to: p1, control: mid)
        }
        
        return path
    }
}


struct SimpleAreaChartView: View {
    let points: [Point]
    
    var body: some View {
        ZStack {
            // Filled area
            SmoothLineChartShape(points: points)
                .fill(
                    LinearGradient(
                        colors: [
                            Color.green.opacity(0.3),
                            Color.green.opacity(0.0)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .mask(
                    // Close path down to bottom to create an "area"
                    GeometryReader { geo in
                        Path { path in
                            let rect = geo.frame(in: .local)
                            let shapePath = SmoothLineChartShape(points: points)
                                .path(in: rect)
                            
                            path.addPath(shapePath)
                            if let last = shapePath.currentPoint {
                                path.addLine(to: CGPoint(x: last.x, y: rect.maxY))
                                path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
                                path.closeSubpath()
                            }
                        }
                    }
                )
            
            // Line
            SmoothLineChartShape(points: points)
                .stroke(
                    Color.green,
                    style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round)
                )
        }
        .padding()
        .background(Color.white)
    }
    
}
