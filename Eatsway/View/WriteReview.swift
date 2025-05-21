import SwiftUI
import Foundation
import Combine

// Helper untuk menutup keyboard
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct WriteReview: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: FilterViewModel
    @State var showSuccessPopup: Bool = false

    var tenant: TenantModel
    @State private var rating: Double = 0
    @State private var selectedTypes: [String] = []
    @State private var detailReview: String = ""
    @FocusState private var isReviewFocused: Bool
    
    let types = ["food", "service"]

    var body: some View {
        ZStack{
            Color(.gray.opacity(0.2))
                .ignoresSafeArea()
                .onTapGesture {
                    UIApplication.shared.endEditing() // ⬅️ Tutup keyboard jika ketuk area kosong
                }
            

            
            VStack(spacing: 30) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("How was your experience?")
                        .font(.title2)
                        .bold()
                    HStack {
                        ForEach(1..<6) { index in
                            Image(systemName: index <= Int(rating) ? "star.fill" : "star")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    rating = Double(index)
                                }
                        }
                    }
                }
                .padding()
                .padding(.leading, -50)
                .frame(width: 360)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))

                VStack(alignment: .leading, spacing: 20) {
                    Text("What impressed you?")
                        .font(.title2)
                        .bold()
                    
                    HStack(spacing: 30) {
                        ForEach(types, id: \.self) { type in
                            Button(action: {
                                toggleType(type)
                            }) {
                                Text(type.capitalized)
                                    .foregroundColor(selectedTypes.contains(type) ? .white : Color.black)
                                    .font(.subheadline)
                                    .bold()
                                    .frame(width: 136, height: 30)
                                    .background(selectedTypes.contains(type) ? Color.eatswayOrange : Color.clear)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.eatswayOrange, lineWidth: 1)
                                    )
                            }
                        }

                    }
                }
                .padding()
                .padding(.leading, -22)
                .frame(width: 360)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))

                VStack(alignment: .leading, spacing: 20) {
                    Text("Add Detail Review")
                        .font(.title2)
                        .bold()
                        .padding(.leading, 4)

                    ZStack(alignment: .topLeading) {
                        if detailReview.isEmpty {
                            Text("Write here")
                                .foregroundColor(.gray)
                                .padding(.top, 8)
                                .padding(.leading, 5)
                        }

                        TextEditor(text: $detailReview)
                            .focused($isReviewFocused)
                            .padding(8)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer()
                                    Button("Done") {
                                        isReviewFocused = false // ⬅️ Tutup keyboard
                                    }
                                }
                            }
                    }
                    .frame(height: 120)
                }
                .padding()
                .frame(width: 360)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))

                Spacer()
            }
            .padding()
            .padding(.top, 50)
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.eatswayOrange)
                    .padding(15)
                    .background(Color.black.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.leading, 20)

            VStack {
                Spacer()
                Divider().background(Color.gray.opacity(0.3))
                HStack {
                    Button {
                        vm.addReview(to: tenant.tenantID, newReview:
                            ReviewModel(
                                reviewName: "Anonymous",
                                reviewType: selectedTypes,
                                reviewDate: Date(),
                                reviewComment: detailReview,
                                reviewRating: rating)
                        )
                        showSuccessPopup = true
                        UIApplication.shared.endEditing()
                    } label: {
                        Text("Submit")
                            .font(.headline)
                            .padding(.horizontal, 60)
                            .padding(.vertical, 20)
                            .background(Color.eatswayOrange, in: .capsule)
                            .foregroundStyle(.white)
                    }
                    .padding(.top, 20)
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: 70)
                .background(Color.white.ignoresSafeArea(edges: .bottom))
            }

        }
        .alert("Review Submitted", isPresented: $showSuccessPopup) {
            Button("OK") {
                dismiss()
            }
        } message: {
            Text("Thank you for your review!")
        }
        .navigationBarBackButtonHidden(true)
    }

    func toggleType(_ type: String) {
        if selectedTypes.contains(type) {
            selectedTypes.removeAll { $0 == type }
        } else {
            selectedTypes.append(type)
        }
    }
}

#Preview {
    let vm = FilterViewModel()
    let tenant = TenantModel(
        image: "Mama Djempol",
        name: "Mama Djempol",
        maxPrice: 14,
        minPrice: 4,
        tenantDescription: "Mama Djempol adalah warung makan yang menyediakan berbagai jenis masakan rumahan dengan harga yang terjangkau.",
        labels: [.noodles, .chicken, .vegetables],
        rating: 4.5,
        menus: [],
        reviews: [
            ReviewModel(
                reviewName: "Andi Santoso",
                reviewType: ["food"],
                reviewImage: nil,
                reviewDate: Date(),
                reviewComment: "Makanannya enak banget! Porsinya pas dan harganya terjangkau.",
                reviewRating: 4.0
            ),
            ReviewModel(
                reviewName: "Budi Hartono",
                reviewType: ["service"],
                reviewImage: nil,
                reviewDate: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
                reviewComment: "Lumayan enak tapi nunggu makanannya agak lama.",
                reviewRating: 3.0
            ),
            ReviewModel(
                reviewName: "Citra Lestari",
                reviewType: ["food"],
                reviewImage: nil,
                reviewDate: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
                reviewComment: "Rasa makanan otentik banget, cocok buat yang suka masakan rumahan.",
                reviewRating: 5.0
            ),
            ReviewModel(
                reviewName: "Citra Lestari",
                reviewType: ["food"],
                reviewImage: nil,
                reviewDate: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
                reviewComment: "Rasa makanan otentik banget, cocok buat yang suka masakan rumahan.",
                reviewRating: 5.0
            ),
            ReviewModel(
                reviewName: "Citra Lestari",
                reviewType: ["food"],
                reviewImage: nil,
                reviewDate: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
                reviewComment: "Rasa makanan otentik banget, cocok buat yang suka masakan rumahan.",
                reviewRating: 5.0
            )
        ]
    )
    
    WriteReview(tenant: tenant)
        .environmentObject(vm)
}
