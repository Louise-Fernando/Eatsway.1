//
//  TenantSeeder.swift
//  Eatsway
//
//  Created by Louise Fernando on 26/05/25.
//

import Foundation
import SwiftData

struct TenantSeeder{
    static func generateTenantModel() -> [TenantModel] {
        return [
            TenantModel(
                image: "Mama Djempol",
                name: "Mama Djempol",
                maxPrice: 14,
                minPrice: 4,
                tenantDescription: "Mama Djempol adalah warung makan yang menyediakan berbagai jenis masakan rumahan dengan harga yang terjangkau.",
                labels: [.noodles, .chicken, .vegetables],
                rating: 1,
                menus: [
                    MenuModel(
                        name: "Ayam Lada Hitam", image: "Ayam Lada Hitam",
                        description:
                            "Oseng-oseng daging ayam dengan bumbu lada hitam",
                        price: 14),

                    MenuModel(
                        name: "Ayam Rica-Rica", image: "Ayam Rica Rica",
                        description:
                            "Olahan ayam dengan bumbu rica-rica khas manado",
                        price: 11),

                    MenuModel(
                        name: "Mie Goreng", image: "Mie Goreng",
                        description: "Mie goreng dengan bumbu lezat", price: 4),

                    MenuModel(
                        name: "Kentang Mustofa", image: "Kentang Mustofa",
                        description: "Kentang kering dengan bumbu balado", price: 5)

                ],
                reviews: [
                    ReviewModel(
                        reviewName: "Andi Santoso",
                        reviewType: ["food"],
                        reviewImage: nil,
                        reviewDate: Date(),
                        reviewComment: "Makanannya enak banget! Porsinya pas dan harganya terjangkau.",
                        reviewRating: 4.5
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
                    )]
            ),
            TenantModel(
                image: "Mustafa Minang",
                name: "Mustafa Minang",
                maxPrice: 33,
                minPrice: 15,
                tenantDescription: "Mustafa Minang adalah rumah makan yang menjual berbagai masakan dari Sumatera Barat",
                labels: [.chicken, .rice, .padang],
                rating: 2.5,
                menus: [
                    MenuModel(
                        name: "Nasi + Telor", image: "Nasi Telur",
                        description:
                            "Nasi putih dengan lauk telur dadar dan tambahan sayuran",
                        price: 15),

                    MenuModel(
                        name: "Nasi + Ayam Bakar", image: "Nasi Ayam Bakar",
                        description:
                            "Nasi putih dengan lauk ayam bakar dan tambahan sayuran",
                        price: 22),
                    MenuModel(
                        name: "Nasi + Rendang", image: "Nasi Rendang",
                        description:
                            "Nasi putih dengan lauk rendang dan tambahan sayuran",
                        price: 25),
                    MenuModel(
                        name: "Nasi + Gulai Tunjang", image: "Nasi Gulai Tunjang",
                        description:
                            "Nasi putih dengan lauk gulai tunjang dan tambahan sayuran",
                        price: 33)
                ],
                reviews: [
                    ReviewModel(
                        reviewName: "Andi Santoso",
                        reviewType: ["food"],
                        reviewImage: nil,
                        reviewDate: Date(),
                        reviewComment: "Makanannya enak banget! Porsinya pas dan harganya terjangkau.",
                        reviewRating: 4.5
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
                    )]
            ),
            TenantModel(
                image: "Bakso Joss",
                name: "Bakso Joss",
                maxPrice: 25,
                minPrice: 15,
                tenantDescription: "Bakso Joss merupakan rumah makan yang menjual berbagai olahan bakso",
                labels: [.bakso],
                rating: 3.75,
                menus: [
                    MenuModel(
                        name: "Bakso Polos", image: "Bakso Polos",
                        description: "Bakso polos dengan kuah kaldu yang gurih",
                        price: 22),
                    MenuModel(
                        name: "Bakso Malang", image: "Bakso Malang",
                        description:
                            "Bakso malang dengan kuah kaldu yang gurih dan pangsit renyah",
                        price: 15),
                    MenuModel(
                        name: "Bakso Telur", image: "Bakso Telur",
                        description:
                            "Bakso isi telur dengan kuah kaldu yang gurih dan pangsit renyah",
                        price: 22),
                    MenuModel(
                        name: "Bakso Besar", image: "Bakso Besar",
                        description:
                            "Bakso dengan ukuran jumbo dengan kuah kaldu yang gurih",
                        price: 25)

                ],
                reviews: [
                    ReviewModel(
                        reviewName: "Andi Santoso",
                        reviewType: ["food"],
                        reviewImage: nil,
                        reviewDate: Date(),
                        reviewComment: "Makanannya enak banget! Porsinya pas dan harganya terjangkau.",
                        reviewRating: 4.5
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
                    )]
            ),
            TenantModel(
                image: "Warung Gado Gado",
                name: "Warung Gado Gado",
                maxPrice: 25,
                minPrice: 17,
                tenantDescription: "Menjual gado-gado dan ketoprak",
                labels: [.vegetables, .rice],
                rating: 4.8,
                menus: [
                    MenuModel(name: "Gado-gado", image: "Gado Gado", description: "Gado gado standard tanpa lontong", price: 17),
                    MenuModel(name: "Gado-gado Telur", image: "Gado Gado Telur", description: "Gado gado dengan telur tanpa lontong", price: 20),
                    MenuModel(name: "Gado-gado Lontong", image: "Gado Gado Lontong", description: "Gado gado standard dengan lontong", price: 22),
                ]
                ,
                reviews: [
                    ReviewModel(
                        reviewName: "Andi Santoso",
                        reviewType: ["food"],
                        reviewImage: nil,
                        reviewDate: Date(),
                        reviewComment: "Makanannya enak banget! Porsinya pas dan harganya terjangkau.",
                        reviewRating: 4.5
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
                    )]
               
            )
        ]
        
        
    }
}


var seed = [
    TenantModel(
        image: "Mama Djempol",
        name: "Mama Djempol",
        maxPrice: 14,
        minPrice: 4,
        tenantDescription: "Mama Djempol adalah warung makan yang menyediakan berbagai jenis masakan rumahan dengan harga yang terjangkau.",
        labels: [.noodles, .chicken, .vegetables],
        rating: 1,
        menus: [
            MenuModel(
                name: "Ayam Lada Hitam", image: "Ayam Lada Hitam",
                description:
                    "Oseng-oseng daging ayam dengan bumbu lada hitam",
                price: 14),

            MenuModel(
                name: "Ayam Rica-Rica", image: "Ayam Rica Rica",
                description:
                    "Olahan ayam dengan bumbu rica-rica khas manado",
                price: 11),

            MenuModel(
                name: "Mie Goreng", image: "Mie Goreng",
                description: "Mie goreng dengan bumbu lezat", price: 4),

            MenuModel(
                name: "Kentang Mustofa", image: "Kentang Mustofa",
                description: "Kentang kering dengan bumbu balado", price: 5)

        ],
        reviews: [
            ReviewModel(
                reviewName: "Andi Santoso",
                reviewType: ["food"],
                reviewImage: nil,
                reviewDate: Date(),
                reviewComment: "Makanannya enak banget! Porsinya pas dan harganya terjangkau.",
                reviewRating: 4.5
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
            )]
    ),
    TenantModel(
        image: "Mustafa Minang",
        name: "Mustafa Minang",
        maxPrice: 33,
        minPrice: 15,
        tenantDescription: "Mustafa Minang adalah rumah makan yang menjual berbagai masakan dari Sumatera Barat",
        labels: [.chicken, .rice, .padang],
        rating: 2.5,
        menus: [
            MenuModel(
                name: "Nasi + Telor", image: "Nasi Telur",
                description:
                    "Nasi putih dengan lauk telur dadar dan tambahan sayuran",
                price: 15),

            MenuModel(
                name: "Nasi + Ayam Bakar", image: "Nasi Ayam Bakar",
                description:
                    "Nasi putih dengan lauk ayam bakar dan tambahan sayuran",
                price: 22),
            MenuModel(
                name: "Nasi + Rendang", image: "Nasi Rendang",
                description:
                    "Nasi putih dengan lauk rendang dan tambahan sayuran",
                price: 25),
            MenuModel(
                name: "Nasi + Gulai Tunjang", image: "Nasi Gulai Tunjang",
                description:
                    "Nasi putih dengan lauk gulai tunjang dan tambahan sayuran",
                price: 33)
        ],
        reviews: [
            ReviewModel(
                reviewName: "Andi Santoso",
                reviewType: ["food"],
                reviewImage: nil,
                reviewDate: Date(),
                reviewComment: "Makanannya enak banget! Porsinya pas dan harganya terjangkau.",
                reviewRating: 4.5
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
            )]
    ),
    TenantModel(
        image: "Bakso Joss",
        name: "Bakso Joss",
        maxPrice: 25,
        minPrice: 15,
        tenantDescription: "Bakso Joss merupakan rumah makan yang menjual berbagai olahan bakso",
        labels: [.bakso],
        rating: 3.75,
        menus: [
            MenuModel(
                name: "Bakso Polos", image: "Bakso Polos",
                description: "Bakso polos dengan kuah kaldu yang gurih",
                price: 22),
            MenuModel(
                name: "Bakso Malang", image: "Bakso Malang",
                description:
                    "Bakso malang dengan kuah kaldu yang gurih dan pangsit renyah",
                price: 15),
            MenuModel(
                name: "Bakso Telur", image: "Bakso Telur",
                description:
                    "Bakso isi telur dengan kuah kaldu yang gurih dan pangsit renyah",
                price: 22),
            MenuModel(
                name: "Bakso Besar", image: "Bakso Besar",
                description:
                    "Bakso dengan ukuran jumbo dengan kuah kaldu yang gurih",
                price: 25)

        ],
        reviews: [
            ReviewModel(
                reviewName: "Andi Santoso",
                reviewType: ["food"],
                reviewImage: nil,
                reviewDate: Date(),
                reviewComment: "Makanannya enak banget! Porsinya pas dan harganya terjangkau.",
                reviewRating: 4.5
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
            )]
    ),
    TenantModel(
        image: "Warung Gado Gado",
        name: "Warung Gado Gado",
        maxPrice: 25,
        minPrice: 17,
        tenantDescription: "Menjual gado-gado dan ketoprak",
        labels: [.vegetables, .rice],
        rating: 4.8,
        menus: [
            MenuModel(name: "Gado-gado", image: "Gado Gado", description: "Gado gado standard tanpa lontong", price: 17),
            MenuModel(name: "Gado-gado Telur", image: "Gado Gado Telur", description: "Gado gado dengan telur tanpa lontong", price: 20),
            MenuModel(name: "Gado-gado Lontong", image: "Gado Gado Lontong", description: "Gado gado standard dengan lontong", price: 22),
        ]
        ,
        reviews: [
            ReviewModel(
                reviewName: "Andi Santoso",
                reviewType: ["food"],
                reviewImage: nil,
                reviewDate: Date(),
                reviewComment: "Makanannya enak banget! Porsinya pas dan harganya terjangkau.",
                reviewRating: 4.5
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
            )]
       
    )
]
