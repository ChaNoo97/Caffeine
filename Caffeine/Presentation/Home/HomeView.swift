//
//  HomeView.swift
//  Caffeine
//
//  Created by Hoo's MacBookPro on 2023/05/13.
//

import SwiftUI

struct HomeView: View {
	var body: some View {
		ScrollView {
			VStack(spacing: 0) {
				assetView
					.padding(.horizontal, 10)
					.padding(.bottom, 4)
				
				makeSpacer(height: 4)
				
				buttonView
					.padding(.horizontal, 10)
					.padding(.vertical, 4)
				
				assetStatus
					.padding(.horizontal, 10)
			}
		}
		.padding(.top, 1)
	}
	
	private var assetView: some View {
		VStack(spacing: 0) {
			HStack {
				VStack(alignment: .leading) {
					Text("총 자산")
						.font(.caption)
					
					Text("542,000원")
						.font(.title.bold())
				}
				
				Spacer()
			}
		}
	}
	
	private var buttonView: some View {
		HStack(spacing: 0) {
			makeButton(
				image: .init(systemName: "note.text"),
				title: "수익",
				action: { print("123") }
			)
			
			makeButton(
				image: .init(systemName: "chart.line.uptrend.xyaxis.circle.fill"),
				title: "자산",
				action: { print("123") }
			)
			
			makeButton(
				image: .init(systemName: "chart.pie.fill"),
				title: "비중",
				action: { print("123") }
			)
			
			makeButton(
				image: .init(systemName: "chart.bar.fill"),
				title: "배당",
				action: { print("123") }
			)
		}
	}
	
	private var assetStatus: some View {
		VStack(spacing: 0) {
			HStack(spacing: 0) {
				Text("투자")
					.font(.headline.bold())
				
				Spacer()
				
				makeIcon(
					image: .init(systemName: "chevron.up"),
					action: { print("Arrow up Icon") }
				)
			}
			.padding(.vertical, 10)
			
			HStack {
				Text("1개")
					.font(.headline)
				
				Spacer()
				
				makeIcon(
					image: .init(systemName: "plus"),
					action: { print("plus button") }
				)
			}
			.padding(.vertical, 10)
			
			
		}
	}

	@ViewBuilder private func makeButton(
		image: Image,
		title: String,
		action: @escaping () -> Void
	) -> some View {
		Button(
			action: action,
			label: {
				HStack(spacing: 0) {
					Spacer ()
					
					image
						.padding(.trailing, 4)
						.foregroundColor(.black)
					
					Text(title)
						.font(.caption.bold())
						.foregroundColor(.black)
					
					Spacer ()
				}
				.padding(.vertical, 4)
			}
		)
	}
	
	@ViewBuilder private func makeIcon(
		image: Image,
		action: @escaping () -> Void
	) -> some View {
		Button(
			action: action,
			label: {
				image
					.foregroundColor(.black)
					.padding(.all, 4)
			}
		)
	}
	
	@ViewBuilder private func makeSpacer(
		height: CGFloat
	) -> some View {
		Rectangle()
			.frame(height: height)
			.foregroundColor(.gray)
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
