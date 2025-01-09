//
//  ContentView.swift
//  TossDemo
//
//  Created by USER on 1/2/25.
//

import SwiftUI

struct MainView: View {
//    @State private var navigateToTransferView = false
    
    var body: some View {
        NavigationStack {
            ScrollView{
                HStack(spacing: 0){
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160)
                    //                Image("logo_simple")
                    //                    .resizable()
                    //                    .frame(width: 40, height: 40)
                    //
                    //                Text("toss")
                    //                    .font(.pretendardSemiBold(size: 28))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 0)
                
                Card{
                    HStack(alignment: .center, spacing: 0){
                        Text("토스뱅크")
                            .font(.pretendardSemiBold(size: 20))
                            .padding(.leading, 16)
                        Spacer()
                        Button(
                            action: {},
                            label: {
                                Image(systemName: "arrow.right")
                                    .foregroundColor(Color.black)
                            }
                        )
                        .padding(.trailing, 16)
                    }
                }
                
                Card{
//                    AccountCell(image: "logo_simple", title: "2,345,000원", subtitle: "내 급여계좌", buttonText: "송금", action: {
//                        navigateToTransferView = true
//                    })
//                    .navigationDestination(isPresented: $navigateToTransferView) {
//                        TransferView() // Destination view
//                    }
                    AccountCell(image: "logo_simple", title: "2,345,000원", subtitle: "내 급여계좌", buttonText: "송금", destination: AnyView (
                        TransferView()
                    ))
                    
                    AccountCell(emoji: "✈", title: "1,000원", subtitle: "하나은행", buttonText: "송금", destination: AnyView (
                        TransferView()
                    ))
                    
                    AccountCell(emoji: "🔵", title: "9,999,000원", subtitle: "우리은행", buttonText: "송금", destination: AnyView (
                        TransferView()
                    ))
                    
                    AccountCell(emoji: "🟢", title: "11,000원", subtitle: "농협은행", buttonText: "송금", destination: AnyView (
                        TransferView()
                    ))
                    
                    AccountCell(emoji: "🟠", title: "341,000원", subtitle: "주황은행", buttonText: "송금", destination: AnyView (
                        TransferView()
                    ))
                    
                    AccountCell(emoji: "💼", title: "55,000원", subtitle: "월급", buttonText: "송금", destination: AnyView (
                        TransferView()
                    ))
                    
                    AccountCell(emoji: "🪖", title: "1,000,000원", subtitle: "군적금", buttonText: "송금", destination: AnyView (
                        TransferView()
                    ))
                    
                    AccountCell(emoji: "🎁", title: "300,000원", subtitle: "축하", buttonText: "송금", destination: AnyView (
                        TransferView()
                    ))
                    
                    AccountCell(emoji: "🎥", title: "100,000원", subtitle: "문화생활", buttonText: "송금", destination: AnyView (
                        TransferView()
                    ))
                    
                    AccountCell(emoji: "⚽", title: "200,000원", subtitle: "운동", buttonText: "송금", destination: AnyView (
                        TransferView()
                    ))
                    
                    
                    AccountCell(emoji: "💰", title: "3원", subtitle: "토스뱅크에 쌓인 이자", buttonText: "지금 받기")
                    AccountCell(emoji: "🏦", title: "14,140,984원", subtitle: "저축・2개")
                    Divider()
                        .padding(.horizontal, 16)
                    Text("내 계좌・대출・증권・포인트 보기 ->")
                        .font(.pretendardRegular(size: 16))
                        .padding(.top, 14)
                        .padding(.horizontal, 16)
                }
                
                Card{
                    AccountCell(emoji: "💸" ,title: "138,060원", subtitle: "1월에 쓴 돈", buttonText: "내역")
                    AccountCell(emoji: "💳", title: "9,900원", subtitle: "1월 13일 낼 카드값")
                }
                
                Card{
                    HStack(alignment: .center, spacing: 0){
                        Text("내 신용점수")
                            .font(.pretendardRegular(size: 16))
                            .foregroundColor(.black.opacity(0.5))
                        Spacer()
                        Button(
                            action: {},
                            label: {
                                Text("확인하기 ->")
                                    .font(.pretendardRegular(size: 16))
                                    .foregroundColor(.black.opacity(0.5))
                            }
                        )
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 8)
                    
                    Divider()
                        .padding(.horizontal, 16)
                    
                    HStack(alignment: .center, spacing: 25) {
                        ServiceButton(title: "계좌개설", action: {})
                        VerticalDivider(height: 30)
                        ServiceButton(title: "카드발급", action: {})
                        VerticalDivider(height: 30)
                        ServiceButton(title: "대출받기", action: {})
                    }
                    .padding(.top, 8)
                    .padding(.horizontal, 16)
                }
                
            }
            .scrollIndicators(.hidden)
            .background(Color.gray.opacity(0.15))
        }
    }
}




#Preview {
    MainView()
}

// MARK: - Card

// state 변경이 필요할때는 구조체
struct Card<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
        }
        .padding(.vertical, 20)
        .background(Color.white)
        .cornerRadius(12)
        //        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .padding(.horizontal, 16)
        .padding(.bottom, 14)
    }
}


// UI 레이아웃만 필요할때 함수
//@ViewBuilder
//func Card<Content: View>(@ViewBuilder content: () -> Content) -> some View {
//    VStack {
//        content()
//    }
//    .padding(16)
//    .background(Color.white)
//    .cornerRadius(12)
//    .shadow(radius: 4)
//}


// MARK: - AccountCell

struct AccountCell: View {
    let image: String?
    let emoji: String?
    let title: String
    let subtitle: String
    let buttonText: String?
    let destination: AnyView?
    
    
    init(image: String? = nil, emoji: String? = nil, title: String, subtitle: String, buttonText: String? = nil, destination: AnyView? = nil) {
        self.image = image
        self.emoji = emoji
        self.title = title
        self.subtitle = subtitle
        self.buttonText = buttonText
        self.destination = destination
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            if let image = image {
                Image(image)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(10)
                    .background(Color.blue.opacity(0.15))
                    .cornerRadius(10)
            }
            
            if let emoji = emoji {
                Text(emoji)
                    .font(.tossFace(size: 18))
                    .padding(10)
                    .background(Color.blue.opacity(0.15))
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading, spacing: 5){
                Text(title)
                    .font(.pretendardSemiBold(size: 20))
                Text(subtitle)
                    .font(.pretendardRegular(size: 16))
            }
            
            Spacer()
            
            if let buttonText = buttonText, let destination = destination {
                NavigationLink(destination: destination){
                    Text(buttonText)
                        .font(.system(size: 16))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .background(Color.gray.opacity(0.2))
                        .foregroundStyle(Color.gray)
                        .cornerRadius(5)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}


// MARK: - ServiceButton

struct ServiceButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(
            action: action,
            label: {
                Text(title)
                    .font(.pretendardSemiBold(size: 18))
                    .foregroundColor(Color.black)
            }
        )
    }
}



// MARK: - VerticalDivider
struct VerticalDivider: View {
    var color: Color = .gray.opacity(0.5)
    var width: CGFloat = 0.8
    var height: CGFloat? = nil
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: width, height: height ?? 10)
    }
}
