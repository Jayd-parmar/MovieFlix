//
//  MockUpcomingData.swift
//  MovieFlixTests
//
//  Created by Jaydip Parmar on 08/11/23.
//

import Foundation
@testable import MovieFlix

let upcomingJsonRespone = """
    {
        "dates": {
            "maximum": "2023-12-06",
            "minimum": "2023-11-15"
        },
        "page": 1,
        "results": [
            {
                "adult": false,
                "backdrop_path": "/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg",
                "genre_ids": [
                    27,
                    9648
                ],
                "id": 507089,
                "original_language": "en",
                "original_title": "Five Nights at Freddy's",
                "overview": "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems.",
                "popularity": 2653.844,
                "poster_path": "/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg",
                "release_date": "2023-10-25",
                "title": "Five Nights at Freddy's",
                "video": false,
                "vote_average": 8.221,
                "vote_count": 1697
            },
            {
                "adult": false,
                "backdrop_path": "/dZbLqRjjiiNCpTYzhzL2NMvz4J0.jpg",
                "genre_ids": [
                    27,
                    53
                ],
                "id": 951491,
                "original_language": "en",
                "original_title": "Saw X",
                "overview": "Between the events of 'Saw' and 'Saw II', a sick and desperate John Kramer travels to Mexico for a risky and experimental medical procedure in hopes of a miracle cure for his cancer, only to discover the entire operation is a scam to defraud the most vulnerable. Armed with a newfound purpose, the infamous serial killer returns to his work, turning the tables on the con artists in his signature visceral way through devious, deranged, and ingenious traps.",
                "popularity": 1077.969,
                "poster_path": "/aQPeznSu7XDTrrdCtT5eLiu52Yu.jpg",
                "release_date": "2023-09-26",
                "title": "Saw X",
                "video": false,
                "vote_average": 7.356,
                "vote_count": 905
            },
            {
                "adult": false,
                "backdrop_path": "/pA3vdhadJPxF5GA1uo8OPTiNQDT.jpg",
                "genre_ids": [
                    28,
                    18
                ],
                "id": 678512,
                "original_language": "en",
                "original_title": "Sound of Freedom",
                "overview": "The story of Tim Ballard, a former US government agent, who quits his job in order to devote his life to rescuing children from global sex traffickers.",
                "popularity": 2071.52,
                "poster_path": "/qA5kPYZA7FkVvqcEfJRoOy4kpHg.jpg",
                "release_date": "2023-07-03",
                "title": "Sound of Freedom",
                "video": false,
                "vote_average": 8.16,
                "vote_count": 1213
            },
            {
                "adult": false,
                "backdrop_path": "/iiXliCeykkzmJ0Eg9RYJ7F2CWSz.jpg",
                "genre_ids": [
                    28,
                    53,
                    80
                ],
                "id": 762430,
                "original_language": "en",
                "original_title": "Retribution",
                "overview": "When a mysterious caller puts a bomb under his car seat, Matt Turner begins a high-speed chase across the city to complete a specific series of tasks- all with his kids trapped in the back seat.",
                "popularity": 890.39,
                "poster_path": "/ljl70pjLIX1hx3bPyCCbxGj6WPr.jpg",
                "release_date": "2023-08-23",
                "title": "Retribution",
                "video": false,
                "vote_average": 6.981,
                "vote_count": 596
            },
            {
                "adult": false,
                "backdrop_path": "/azD31DjpV3PJfjF3h72LVw2WCSD.jpg",
                "genre_ids": [
                    27
                ],
                "id": 807172,
                "original_language": "en",
                "original_title": "The Exorcist: Believer",
                "overview": "When two girls disappear into the woods and return three days later with no memory of what happened to them, the father of one girl seeks out Chris MacNeil, who's been forever altered by what happened to her daughter fifty years ago.",
                "popularity": 747.977,
                "poster_path": "/qVKirUdmoex8SdfUk8WDDWwrcCh.jpg",
                "release_date": "2023-10-04",
                "title": "The Exorcist: Believer",
                "video": false,
                "vote_average": 6.178,
                "vote_count": 479
            },
            {
                "adult": false,
                "backdrop_path": "/cavK9ox37pxDg11RvJINMH63onU.jpg",
                "genre_ids": [
                    27
                ],
                "id": 744857,
                "original_language": "es",
                "original_title": "Cuando acecha la maldad",
                "overview": "Residents of a small rural town discover that a demon is about to be born among them. They desperately try to escape before the evil is born, but it may be too late.",
                "popularity": 398.05,
                "poster_path": "/iQ7G9LhP7NRRIUM4Vlai3eOxBAc.jpg",
                "release_date": "2023-10-05",
                "title": "When Evil Lurks",
                "video": false,
                "vote_average": 7.618,
                "vote_count": 148
            },
            {
                "adult": false,
                "backdrop_path": "/45zVtZx6Tzx3RKeDziK25K9geFf.jpg",
                "genre_ids": [
                    16,
                    10751,
                    10402,
                    14,
                    35
                ],
                "id": 901362,
                "original_language": "en",
                "original_title": "Trolls Band Together",
                "overview": "When Branch’s brother, Floyd, is kidnapped for his musical talents by a pair of nefarious pop-star villains, Branch and Poppy embark on a harrowing and emotional journey to reunite the other brothers and rescue Floyd from a fate even worse than pop-culture obscurity.",
                "popularity": 259.55,
                "poster_path": "/bkpPTZUdq31UGDovmszsg2CchiI.jpg",
                "release_date": "2023-10-12",
                "title": "Trolls Band Together",
                "video": false,
                "vote_average": 6.411,
                "vote_count": 28
            },
            {
                "adult": false,
                "backdrop_path": "/xHqTnPtpd9Qd7R0fVtoqxZYM67Q.jpg",
                "genre_ids": [
                    80,
                    53,
                    28
                ],
                "id": 958006,
                "original_language": "en",
                "original_title": "The Kill Room",
                "overview": "A hitman, his boss, an art dealer and a money-laundering scheme that accidentally turns the assassin into an overnight avant-garde sensation, one that forces her to play the art world against the underworld.",
                "popularity": 195.542,
                "poster_path": "/qKpdy7N6zX05eisopvvviiTwPxb.jpg",
                "release_date": "2023-09-14",
                "title": "The Kill Room",
                "video": false,
                "vote_average": 6.167,
                "vote_count": 36
            },
            {
                "adult": false,
                "backdrop_path": "/mfm4srsPALxaeOMFFFJ0drXTyXy.jpg",
                "genre_ids": [
                    35,
                    12
                ],
                "id": 912908,
                "original_language": "en",
                "original_title": "Strays",
                "overview": "When Reggie is abandoned on the mean city streets by his lowlife owner, Doug, Reggie is certain that his beloved owner would never leave him on purpose. But once Reggie falls in with Bug, a fast-talking, foul-mouthed stray who loves his freedom and believes that owners are for suckers, Reggie finally realizes he was in a toxic relationship and begins to see Doug for the heartless sleazeball that he is.",
                "popularity": 184.709,
                "poster_path": "/muDaKftykz9Nj1mhRheMdbuNI9Z.jpg",
                "release_date": "2023-08-17",
                "title": "Strays",
                "video": false,
                "vote_average": 7.552,
                "vote_count": 488
            },
            {
                "adult": false,
                "backdrop_path": "/iEFuHjqrE059SmflBva1JzDJutE.jpg",
                "genre_ids": [
                    16,
                    10751,
                    28,
                    14,
                    10749
                ],
                "id": 496450,
                "original_language": "fr",
                "original_title": "Miraculous - le film",
                "overview": "A life of an ordinary Parisian teenager Marinette goes superhuman when she becomes Ladybug. Bestowed with magical powers of creation, Ladybug must unite with her opposite, Cat Noir, to save Paris as a new villain unleashes chaos unto the city.",
                "popularity": 191.89,
                "poster_path": "/bBON9XO9Ek0DjRwMBnJNCwC96Cd.jpg",
                "release_date": "2023-07-05",
                "title": "Miraculous: Ladybug & Cat Noir, The Movie",
                "video": false,
                "vote_average": 7.8,
                "vote_count": 634
            },
            {
                "adult": false,
                "backdrop_path": "/wrphIaXVPJ5klAlbjQdLNCsZFIc.jpg",
                "genre_ids": [
                    28,
                    12,
                    878
                ],
                "id": 695721,
                "original_language": "en",
                "original_title": "The Hunger Games: The Ballad of Songbirds & Snakes",
                "overview": "64 years before he becomes the tyrannical president of Panem, Coriolanus Snow sees a chance for a change in fortunes when he mentors Lucy Gray Baird, the female tribute from District 12.",
                "popularity": 119.391,
                "poster_path": "/mBaXZ95R2OxueZhvQbcEWy2DqyO.jpg",
                "release_date": "2023-11-15",
                "title": "The Hunger Games: The Ballad of Songbirds & Snakes",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0
            },
            {
                "adult": false,
                "backdrop_path": "/qbWtbhoKtqta3rQDOe5ed80oB1X.jpg",
                "genre_ids": [
                    28,
                    53
                ],
                "id": 940241,
                "original_language": "en",
                "original_title": "97 Minutes",
                "overview": "A hijacked 767 will crash in just 97 minutes when its fuel runs out. Against the strong will of NSA Deputy Toyin, NSA Director Hawkins prepares to have the plane shot down before it does any catastrophic damage on the ground, leaving the fate of the innocent passengers in the hands of Tyler, one of the alleged hijackers on board who is an undercover Interpol agent - or is he?",
                "popularity": 79.32,
                "poster_path": "/eYGyR8xF8emNs9AJAJSyLXu56kR.jpg",
                "release_date": "2023-06-09",
                "title": "97 Minutes",
                "video": false,
                "vote_average": 4.862,
                "vote_count": 48
            },
            {
                "adult": false,
                "backdrop_path": "/436mzGC6sSM1YsHxdtHD6jVtGxX.jpg",
                "genre_ids": [
                    35,
                    28
                ],
                "id": 866346,
                "original_language": "en",
                "original_title": "The Retirement Plan",
                "overview": "When Ashley and her young daughter Sarah get caught up in a criminal enterprise that puts their lives at risk, she turns to the only person who can help: her estranged father Matt, currently living the life of a retired beach bum in the Cayman Islands. Their reunion is fleeting as they are soon tracked down on the island by crime boss Donnie and his lieutenant Bobo. As Ashley, Sarah, and Matt become entangled in an increasingly dangerous web, Ashley quickly learns her father had a secret past that she knew nothing about and that there is more to her father than meets the eye.",
                "popularity": 77.372,
                "poster_path": "/kv4n3xgRWtkldaD4kyy1FvpW6bO.jpg",
                "release_date": "2023-08-24",
                "title": "The Retirement Plan",
                "video": false,
                "vote_average": 6.5,
                "vote_count": 70
            },
            {
                "adult": false,
                "backdrop_path": "/9sl9k7FjE4g0vCVNkPdR1Fs3Yx8.jpg",
                "genre_ids": [
                    36,
                    18,
                    10752
                ],
                "id": 753342,
                "original_language": "en",
                "original_title": "Napoleon",
                "overview": "A personal look at the French military leader’s origins and swift, ruthless climb to emperor, viewed through the prism of Napoleon’s addictive, volatile relationship with his wife and one true love, Josephine.",
                "popularity": 99.193,
                "poster_path": "/jE5o7y9K6pZtWNNMEw3IdpHuncR.jpg",
                "release_date": "2023-11-22",
                "title": "Napoleon",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0
            },
            {
                "adult": false,
                "backdrop_path": "/9Rq14Eyrf7Tu1xk0Pl7VcNbNh1n.jpg",
                "genre_ids": [
                    28,
                    12,
                    53
                ],
                "id": 646389,
                "original_language": "en",
                "original_title": "Plane",
                "overview": "After a heroic job of successfully landing his storm-damaged aircraft in a war zone, a fearless pilot finds himself between the agendas of multiple militias planning to take the plane and its passengers hostage.",
                "popularity": 99.121,
                "poster_path": "/qi9r5xBgcc9KTxlOLjssEbDgO0J.jpg",
                "release_date": "2023-01-12",
                "title": "Plane",
                "video": false,
                "vote_average": 7.0,
                "vote_count": 1822
            },
            {
                "adult": false,
                "backdrop_path": "/5ut2rC5H1YE0GnNPpl1csnNvqum.jpg",
                "genre_ids": [
                    28,
                    18,
                    80
                ],
                "id": 1093485,
                "original_language": "cn",
                "original_title": "掃毒3︰人在天涯",
                "overview": "Hong Kong police agent Cheung (by Aaron Kwok) works undercover in Kang’s (by Sean Lau) drug cartel, while another undercover cop Au (by Louis Koo) successfully earns their trust in an incident, a brotherly-bond is built among the three. After the Police busts the syndicate in Hong Kong, Kang subsequently hides away in the Golden Triangle, by chance he receives a tip-off about the betrayal within his circle of trust…",
                "popularity": 73.295,
                "poster_path": "/kPjZsEni0KF0IXGXh0kaxNESdGE.jpg",
                "release_date": "2023-07-06",
                "title": "The White Storm 3: Heaven or Hell",
                "video": false,
                "vote_average": 6.512,
                "vote_count": 41
            },
            {
                "adult": false,
                "backdrop_path": "/a0GM57AnJtNi7lMOCamniiyV10W.jpg",
                "genre_ids": [
                    16,
                    12,
                    14,
                    18
                ],
                "id": 508883,
                "original_language": "ja",
                "original_title": "君たちはどう生きるか",
                "overview": "While the Second World War rages, the teenage Mahito, haunted by his mother's tragic death, is relocated from Tokyo to the serene rural home of his new stepmother Natsuko, a woman who bears a striking resemblance to the boy's mother. As he tries to adjust, this strange new world grows even stranger following the appearance of a persistent gray heron, who perplexes and bedevils Mahito, dubbing him the \"long-awaited one.\"",
                "popularity": 85.657,
                "poster_path": "/jDQPkgzerGophKRRn7MKm071vCU.jpg",
                "release_date": "2023-07-14",
                "title": "The Boy and the Heron",
                "video": false,
                "vote_average": 7.4,
                "vote_count": 107
            },
            {
                "adult": false,
                "backdrop_path": "/f9ErVXAyR9EP5WOOp4i5ivBKsKC.jpg",
                "genre_ids": [
                    35
                ],
                "id": 814776,
                "original_language": "en",
                "original_title": "Bottoms",
                "overview": "Unpopular best friends PJ and Josie start a high school self-defense club to meet girls and lose their virginity. They soon find themselves in over their heads when the most popular students start beating each other up in the name of self-defense.",
                "popularity": 68.542,
                "poster_path": "/jeyTQrNEpyE1LZIgVlswYh3sc34.jpg",
                "release_date": "2023-08-25",
                "title": "Bottoms",
                "video": false,
                "vote_average": 6.976,
                "vote_count": 147
            },
            {
                "adult": false,
                "backdrop_path": "/cUHxmWfkp6se0Rt10Kr86bMCYDE.jpg",
                "genre_ids": [
                    35,
                    18,
                    36
                ],
                "id": 1016084,
                "original_language": "en",
                "original_title": "BlackBerry",
                "overview": "Two mismatched entrepreneurs – egghead innovator Mike Lazaridis and cut-throat businessman Jim Balsillie – joined forces in an endeavour that was to become a worldwide hit in little more than a decade. The story of the meteoric rise and catastrophic demise of the world's first smartphone.",
                "popularity": 60.811,
                "poster_path": "/neV35lK7em4rIY9QIoH1cruErPA.jpg",
                "release_date": "2023-02-13",
                "title": "BlackBerry",
                "video": false,
                "vote_average": 7.179,
                "vote_count": 218
            },
            {
                "adult": false,
                "backdrop_path": "/hjyqNFHx5wIO8dqaRi0v2ix1wiR.jpg",
                "genre_ids": [
                    53,
                    28,
                    80,
                    27
                ],
                "id": 808396,
                "original_language": "en",
                "original_title": "God Is a Bullet",
                "overview": "Based on true events and the novel of the same name. Vice detective Bob Hightower finds his ex-wife murdered and daughter kidnapped by a cult. Frustrated by the botched official investigations, he quits the force and infiltrates the cult to hunt down the leader with the help of the cult’s only female victim escapee, Case Hardin.",
                "popularity": 79.943,
                "poster_path": "/5kiLS9nsSJxDdlYUyYGiSUt8Fi8.jpg",
                "release_date": "2023-06-22",
                "title": "God Is a Bullet",
                "video": false,
                "vote_average": 6.3,
                "vote_count": 105
            }
        ],
        "total_pages": 29,
        "total_results": 561
    }
""".data(using: .utf8)

func getUpcomingData() -> MovieModel? {
    let response: MovieModel?
    do {
        guard let data = upcomingJsonRespone else {
            print("nil returned data \n\n")
            return nil
        }
        response =  try JSONDecoder().decode(MovieModel.self, from: data)
    } catch(let error){
        print("error in decode : \(error) \n\n")
        return nil
    }
    return response
}
