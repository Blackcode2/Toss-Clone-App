//
//  TransferView.swift
//  TossDemo
//
//  Created by USER on 1/5/25.
//

import SwiftUI

struct TransferView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var accountNumber: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("어디로 돈을 보낼까요?")
                .font(.pretendardBold(size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 32)
                .padding(.bottom, 16)
            
            ScrollView{
                HStack(alignment: .center, spacing: 0) {
                    TextField("계좌번호 입력", text: $accountNumber)
                        .font(.pretendardSemiBold(size: 20))
                        .keyboardType(.numberPad)
                        .padding(.vertical, 8)
                        .padding(.top, 10)
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                            Text("📷")
                            .font(.tossFace(size: 20))
                        }
                    )
                }
                .overlay(Rectangle()
                    .frame(height: 0.8)
                    .foregroundColor(.black), alignment: .bottom
                )
                .padding(.horizontal, 32)
                
                
                HStack(alignment: .center, spacing: 0){
                    Text("내 계좌")
                        .font(.pretendardSemiBold(size: 18))
                    Spacer()
                    Button(
                        action: {},
                        label: {
                            Text("+19개 ->")
                                .font(.pretendardRegular(size: 16))
                                .foregroundColor(.gray)
                        }
                    )
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 8)
                
                Text("최근 보낸 계좌")
                    .font(.pretendardSemiBold(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 32)
                    .padding(.top, 24)
                
                MyAccountListTile(emoji: "🔵", title: "급여계좌", subtitle: "우리은행 123456789")
                MyAccountListTile(emoji: "🟠", title: "주황계좌", subtitle: "주황은행 8984374737")
                MyAccountListTile(emoji: "🧸", title: "김한동", subtitle: "한동은행 11111111111111")
                MyAccountListTile(emoji: "🎉", title: "생일", subtitle: "우리은행 232582090238")
                MyAccountListTile(emoji: "🎐", title: "홍길동", subtitle: "조선은행 5528293829223")
                MyAccountListTile(emoji: "👕", title: "뮤신사", subtitle: "기업은행 5438282804389")
                MyAccountListTile(emoji: "🇹🇭", title: "태국", subtitle: "태국은행 1236753332663")
                MyAccountListTile(emoji: "🇰🇷", title: "한국", subtitle: "한국은행 343456434789")
                MyAccountListTile(emoji: "🇯🇵", title: "일본", subtitle: "일본은행 120342828323")
                MyAccountListTile(emoji: "🇮🇳", title: "인도", subtitle: "인도은행 4390270923870")
                
            }
            .scrollIndicators(.hidden)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Button(
                    action: {presentationMode.wrappedValue.dismiss()},
                    label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                )
            }
        }
    }
}



struct MyAccountListTile: View {
    let emoji: String
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 10){
            Text(emoji)
                .font(.tossFace(size: 24))
                .padding(14)
                .background(Color.blue.opacity(0.15))
                .cornerRadius(24)
            
            VStack(alignment: .leading, spacing: 14){
                Text(title)
                    .font(.pretendardSemiBold(size: 17))
                Text(subtitle)
                    .font(.pretendardRegular(size: 16))
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 32)
        .padding(.vertical, 8)
    }
}


#Preview {
    TransferView()
}
