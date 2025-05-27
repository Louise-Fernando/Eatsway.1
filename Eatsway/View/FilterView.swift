import SwiftUI
import Foundation


struct FilterView: View {
    @EnvironmentObject var filterVM: FilterViewModel
    @Binding var isShowingFilterPage : Bool// Kontrol untuk menampilkan FilterView modal
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                VStack(alignment: .leading) {
                    Text("Help us set your taste and budget!")
                        .font(.system(size: 26, weight: .bold))
                        .padding(.bottom, 30)
                    
                    VStack(alignment: .leading) {
                        Text("Cuisine Categories")
                            .font(.system(size: 22, weight: .bold))
                            .padding(.bottom, 20)
                        
                        ForEach(filterVM.getChunkedCuisines(), id: \.self) { row in
                            HStack {
                                ForEach(row, id: \.self) { cuisine in
                                    ToggleButton(
                                        buttonText: cuisine.displayText,
                                        isSelected: filterVM.isCuisineSelected(cuisine),
                                        action: {
                                            filterVM.toggleCuisine(cuisine)
                                            print("Selected cuisines: \(filterVM.selectedCuisines)")
                                            
                                        }
                                    )
                                    .padding(.trailing, 16)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 54)
                    
                    VStack(alignment: .leading) {
                        Text("Price")
                            .font(.system(size: 22, weight: .bold))
                            .padding(.bottom, 20)
                        
                        HStack {
                            ForEach(PriceSortingOption.allCases.filter { $0 != .none }, id: \.self) { option in
                                ToggleButton(
                                    buttonText: option.displayText,
                                    isSelected: filterVM.selectSort(option),
                                    action: {
                                        filterVM.togglePriceSorting(option)
                                    }
                                )
                                .padding(.trailing, 16)
                            }
                        }
                        
                    }
                    
                    Spacer()
                }
                Spacer()
            }
            HStack {
                Spacer()
                Button {
                    filterVM.applyFilters()
                    isShowingFilterPage = false
                } label: {
                    Text("Save")
                        .font(.headline)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .foregroundStyle(.white)
            .background(Color.eatswayOrange)
            .cornerRadius(20)
        }
        
        .padding(20)
        .padding(.top, 30)
        
        
    }
}


struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        // Initialize the FilterViewModel untuk inject ke view
        let context = DataController.previewContainer.mainContext
        let filterVM = FilterViewModel(repository: TenantRepository(context: context))
        // Set up preview dengan environment object
        FilterView(isShowingFilterPage: .constant(true))
            .modelContainer(DataController.previewContainer)
            .environmentObject(filterVM)
            .previewLayout(.sizeThatFits) // Optional: Customize the preview size
        //            .padding() // Optional: Add padding untuk visualisasi lebih baik
    }
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        let viewModel = FilterViewModel()
//
//        FilterView(isShowingFilterPage: .constant(true)) // <- pakai .constant
//            .environmentObject(viewModel)
//    }
//}
