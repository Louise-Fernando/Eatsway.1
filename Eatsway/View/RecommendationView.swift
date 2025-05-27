import SwiftUI
import Foundation
import SwiftData


struct RecommendationView: View {
    @Environment(\.modelContext) private var context// : ModelContext
    @EnvironmentObject var filterVM: FilterViewModel
    @State private var isShowingFilterPage = false // Kontrol untuk menampilkan FilterView modal

    var body: some View {
        NavigationStack {
            VStack {
                header
                tenantList
                topRatings
                Spacer()
            }
            .onAppear {
                if filterVM.filteredTenants.isEmpty {
                    filterVM.applyFilters()
                }
            }
            .sheet(isPresented: $isShowingFilterPage) {
                filterViewModal
            }
        }
    }

    // Header View
    var header: some View {
        HStack {
            Text("It's Time to Eat!!")
                .font(.largeTitle)
                .bold()
            Spacer()
            Button(action: {
                isShowingFilterPage = true // Show filter page
            }) {
                Image(systemName: "line.3.horizontal.decrease")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
        }
        .padding(.top, 16)
        .padding(.leading, 16)
        .padding(.trailing, 16)
    }

    // Tenant List View
    var tenantList: some View {
        VStack(alignment: .leading) {
            Text("Recommendations")
                .font(.title2)
                .bold()
                .padding(.top, 6)
                .padding(.leading, 10)

            ScrollView(.horizontal) {
                HStack {
                    ForEach(filterVM.filteredTenants) { tenant in // Menggunakan yang sudah diurutkan
                        tenantCard(for: tenant)
                            .transition(.scale) // Optional animasi sederhana
                    }
                }
            }
            .padding(.top, 10)
        }

    }

    // Tenant Card Component
    func tenantCard(for tenant: TenantModel) -> some View {
        NavigationLink(
            destination: DetailView(tenant: tenant)
                .environmentObject(filterVM)
        ){
            TenantCard(
                tenant: tenant
            )
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
        }
        .buttonStyle(PlainButtonStyle())
    }

    // Top Ratings Section
    var topRatings: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Top Ratings")
                    .font(.title2)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading, 10)
                Spacer()
            }

            if filterVM.topFiltered.isEmpty {
                Text("No top ratings found")
                    .foregroundColor(.gray)
                    .italic()
                    .padding(.leading, 10)
            } else {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(filterVM.topFiltered) { tenant in
                            tenantCard(for: tenant)
                                .transition(.scale)
                        }
                    }
                    .padding(.top, 10)
                }
            }
        }
    }

    // Filter Button View
    var filterButton: some View {
        Button("Filter") {
            isShowingFilterPage = true
        }
        .padding()
    }

    // Modal for Filter View
    var filterViewModal: some View {
        NavigationStack {
            FilterView(isShowingFilterPage: $isShowingFilterPage)
                .environmentObject(filterVM) // Injecting FilterViewModel into FilterView
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isShowingFilterPage = false
                        }
                    }
                }
        }
    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        // Initialize the FilterViewModel untuk inject ke view
        let context = DataController.previewContainer.mainContext

        let filterVM = FilterViewModel(repository: TenantRepository(context: context))
        // Set up preview dengan environment object
        RecommendationView()
            .modelContainer(DataController.previewContainer)
            .environmentObject(filterVM)
            .previewLayout(.sizeThatFits) // Optional: Customize the preview size
//            .padding() // Optional: Add padding untuk visualisasi lebih baik
    }
}

