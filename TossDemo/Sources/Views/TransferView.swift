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

#Preview {
    TransferView()
}
