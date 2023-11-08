//
//  MockTVShowData.swift
//  MovieFlixTests
//
//  Created by Jaydip Parmar on 06/11/23.
//

import Foundation
@testable import MovieFlix

let TvShowJsonResponse = """
    {
        "page": 1,
        "results": [
            {
                "adult": false,
                "backdrop_path": "/q3jHCb4dMfYF6ojikKuHd6LscxC.jpg",
                "genre_ids": [
                    18,
                    10765
                ],
                "id": 84958,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "Loki",
                "overview": "After stealing the Tesseract during the events of “Avengers: Endgame,” an alternate version of Loki is brought to the mysterious Time Variance Authority, a bureaucratic organization that exists outside of time and space and monitors the timeline. They give Loki a choice: face being erased from existence due to being a “time variant” or help fix the timeline and stop a greater threat.",
                "popularity": 3013.268,
                "poster_path": "/voHUmluYmKyleFkTu3lOXQG702u.jpg",
                "first_air_date": "2021-06-09",
                "name": "Loki",
                "vote_average": 8.165,
                "vote_count": 10473
            },
            {
                "adult": false,
                "backdrop_path": "/jWXrQstj7p3Wl5MfYWY6IHqRpDb.jpg",
                "genre_ids": [
                    10763
                ],
                "id": 94722,
                "origin_country": [
                    "DE"
                ],
                "original_language": "de",
                "original_name": "Tagesschau",
                "overview": "German daily news program, the oldest still existing program on German television.",
                "popularity": 3220.063,
                "poster_path": "/7dFZJ2ZJJdcmkp05B9NWlqTJ5tq.jpg",
                "first_air_date": "1952-12-26",
                "name": "Tagesschau",
                "vote_average": 7.248,
                "vote_count": 161
            },
            {
                "adult": false,
                "backdrop_path": "/9xxLWtnFxkpJ2h1uthpvCRK6vta.jpg",
                "genre_ids": [
                    80,
                    18,
                    9648
                ],
                "id": 2734,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "Law & Order: Special Victims Unit",
                "overview": "In the criminal justice system, sexually-based offenses are considered especially heinous. In New York City, the dedicated detectives who investigate these vicious felonies are members of an elite squad known as the Special Victims Unit. These are their stories.",
                "popularity": 2730.194,
                "poster_path": "/ywBt4WKADdMVgxTR1rS2uFwMYTH.jpg",
                "first_air_date": "1999-09-20",
                "name": "Law & Order: Special Victims Unit",
                "vote_average": 7.957,
                "vote_count": 3427
            },
            {
                "adult": false,
                "backdrop_path": "/oOce9hLMVFubjAJliau4kiSNPnW.jpg",
                "genre_ids": [
                    80,
                    18
                ],
                "id": 549,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "Law & Order",
                "overview": "In cases ripped from the headlines, police investigate serious and often deadly crimes, weighing the evidence and questioning the suspects until someone is taken into custody. The district attorney's office then builds a case to convict the perpetrator by proving the person guilty beyond a reasonable doubt. Working together, these expert teams navigate all sides of the complex criminal justice system to make New York a safer place.",
                "popularity": 2651.076,
                "poster_path": "/77OPlbsvX3pzoFbyfpcE3GXMCod.jpg",
                "first_air_date": "1990-09-13",
                "name": "Law & Order",
                "vote_average": 7.489,
                "vote_count": 465
            },
            {
                "adult": false,
                "backdrop_path": "/wU1y7snEVYiJBpZ2k1DjIpHgJbx.jpg",
                "genre_ids": [
                    16,
                    35
                ],
                "id": 1434,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "Family Guy",
                "overview": "Sick, twisted, politically incorrect and Freakin' Sweet animated series featuring the adventures of the dysfunctional Griffin family. Bumbling Peter and long-suffering Lois have three kids. Stewie (a brilliant but sadistic baby bent on killing his mother and taking over the world), Meg (the oldest, and is the most unpopular girl in town) and Chris (the middle kid, he's not very bright but has a passion for movies). The final member of the family is Brian - a talking dog and much more than a pet, he keeps Stewie in check whilst sipping Martinis and sorting through his own life issues.",
                "popularity": 1733.638,
                "poster_path": "/hw2vi8agaJZ7oeSvS8uEYgOtK32.jpg",
                "first_air_date": "1999-01-31",
                "name": "Family Guy",
                "vote_average": 7.294,
                "vote_count": 3930
            },
            {
                "adult": false,
                "backdrop_path": "/hwUQsL1cWt0bmbTxzCompqqvTH9.jpg",
                "genre_ids": [
                    10764
                ],
                "id": 82250,
                "origin_country": [
                    "ES"
                ],
                "original_language": "es",
                "original_name": "Gran hermano VIP",
                "overview": "",
                "popularity": 2055.443,
                "poster_path": "/9269PATr0bmEXKjkpR88mzGmNYI.jpg",
                "first_air_date": "2004-01-22",
                "name": "Gran hermano VIP",
                "vote_average": 4.0,
                "vote_count": 7
            },
            {
                "adult": false,
                "backdrop_path": "/aDRIKJuB63tuJUZf1O4mRmbMTVw.jpg",
                "genre_ids": [
                    10764
                ],
                "id": 6480,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "House Hunters",
                "overview": "Hosted by Suzanne Whang, the show takes viewers behind the scenes as individuals, couples and families learn what to look for and decide whether or not a home is meant for them. Focusing on the emotional experience of finding and purchasing a new home, each episode follows a prospective buyer and real estate agent through the home-buying process, from start to finish.",
                "popularity": 2491.691,
                "poster_path": "/7Bsr9ogG0q6yHtNuIp6bJ6EFpbH.jpg",
                "first_air_date": "1999-09-30",
                "name": "House Hunters",
                "vote_average": 5.1,
                "vote_count": 25
            },
            {
                "adult": false,
                "backdrop_path": "/qmcoEOrTm6BcgR4iO7KBQKE9AKT.jpg",
                "genre_ids": [
                    80,
                    18,
                    10759
                ],
                "id": 4614,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "NCIS",
                "overview": "From murder and espionage to terrorism and stolen submarines, a team of special agents investigates any crime that has a shred of evidence connected to Navy and Marine Corps personnel, regardless of rank or position.",
                "popularity": 1940.516,
                "poster_path": "/2exOHePjOTquUsbThPGhuEjYTyA.jpg",
                "first_air_date": "2003-09-23",
                "name": "NCIS",
                "vote_average": 7.6,
                "vote_count": 2068
            },
            {
                "adult": false,
                "backdrop_path": "/cvlLBcQWpO9X21jDHhgPJnE2aVq.jpg",
                "genre_ids": [
                    80,
                    18,
                    9648
                ],
                "id": 1431,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "CSI: Crime Scene Investigation",
                "overview": "A Las Vegas team of forensic investigators are trained to solve criminal cases by scouring the crime scene, collecting irrefutable evidence and finding the missing pieces that solve the mystery.",
                "popularity": 1776.412,
                "poster_path": "/jBybUiienGpfLoDkbS5nvY4i40A.jpg",
                "first_air_date": "2000-10-06",
                "name": "CSI: Crime Scene Investigation",
                "vote_average": 7.644,
                "vote_count": 1070
            },
            {
                "adult": false,
                "backdrop_path": "/pxeqQX4qFQ0cVxPt5SWZENV5BH3.jpg",
                "genre_ids": [
                    10751,
                    16,
                    35
                ],
                "id": 456,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "The Simpsons",
                "overview": "Set in Springfield, the average American town, the show focuses on the antics and everyday adventures of the Simpson family; Homer, Marge, Bart, Lisa and Maggie, as well as a virtual cast of thousands. Since the beginning, the series has been a pop culture icon, attracting hundreds of celebrities to guest star. The show has also made name for itself in its fearless satirical take on politics, media and American life in general.",
                "popularity": 1156.106,
                "poster_path": "/vHqeLzYl3dEAutojCO26g0LIkom.jpg",
                "first_air_date": "1989-12-17",
                "name": "The Simpsons",
                "vote_average": 8.001,
                "vote_count": 9201
            },
            {
                "adult": false,
                "backdrop_path": "/218ZehBKlH8efPRRccmB7bu0oLQ.jpg",
                "genre_ids": [
                    35,
                    9648,
                    10766,
                    18
                ],
                "id": 219109,
                "origin_country": [
                    "BR"
                ],
                "original_language": "pt",
                "original_name": "Elas por Elas",
                "overview": "Seven friends who met in their youth at an English course meet again 25 years later; Lara, Taís, Helena, Adriana, Renée, Natália and Carol, each of them has a different personality and origin, but they share a deep affection.",
                "popularity": 2469.933,
                "poster_path": "/hCSH5KvSqShWXhFiXr88wtJXwlO.jpg",
                "first_air_date": "2023-09-25",
                "name": "Elas por Elas",
                "vote_average": 9.333,
                "vote_count": 6
            },
            {
                "adult": false,
                "backdrop_path": "/ffyxj73OyMEgwS1JiluoYzd3VGb.jpg",
                "genre_ids": [
                    18
                ],
                "id": 4601,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "Law & Order: Criminal Intent",
                "overview": "The third installment of the “Law & Order” franchise takes viewers deep into the minds of its criminals while following the intense psychological approaches the Major Case Squad uses to solve its crimes.",
                "popularity": 1531.104,
                "poster_path": "/mwynkwd6jql0qamRW6i5Dv6aZ4k.jpg",
                "first_air_date": "2001-09-30",
                "name": "Law & Order: Criminal Intent",
                "vote_average": 7.593,
                "vote_count": 301
            },
            {
                "adult": false,
                "backdrop_path": "/urzEsxKKNgCan2mX5z5heXbUyef.jpg",
                "genre_ids": [
                    10765,
                    10759,
                    18
                ],
                "id": 205715,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "Gen V",
                "overview": "At America's only college for superheroes, gifted students put their moral boundaries to the test, competing for the university's top ranking, and a chance to join The Seven, Vought International's elite superhero team. When the school's dark secrets come to light, they must decide what kind of heroes they want to become.",
                "popularity": 1611.467,
                "poster_path": "/uuot1N5AgZ7xRCKgm4ZCwOhgIJu.jpg",
                "first_air_date": "2023-09-28",
                "name": "Gen V",
                "vote_average": 8.1,
                "vote_count": 330
            },
            {
                "adult": false,
                "backdrop_path": "/xl1wGwaPZInJo1JAnpKqnFozWBE.jpg",
                "genre_ids": [
                    35,
                    10767
                ],
                "id": 59941,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "The Tonight Show Starring Jimmy Fallon",
                "overview": "After Jay Leno's second retirement from the program, Jimmy Fallon stepped in as his permanent replacement. After 42 years in Los Angeles the program was brought back to New York.",
                "popularity": 1347.246,
                "poster_path": "/g4amxJvtpnY79J77xeamnAEUO8r.jpg",
                "first_air_date": "2014-02-17",
                "name": "The Tonight Show Starring Jimmy Fallon",
                "vote_average": 6.004,
                "vote_count": 237
            },
            {
                "adult": false,
                "backdrop_path": "/ds1n5P0Y92cTh6UpbcA89hxM96a.jpg",
                "genre_ids": [
                    18
                ],
                "id": 1416,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "Grey's Anatomy",
                "overview": "Follows the personal and professional lives of a group of doctors at Seattle’s Grey Sloan Memorial Hospital.",
                "popularity": 1541.597,
                "poster_path": "/daSFbrt8QCXV2hSwB0hqYjbj681.jpg",
                "first_air_date": "2005-03-27",
                "name": "Grey's Anatomy",
                "vote_average": 8.251,
                "vote_count": 9593
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    10764
                ],
                "id": 237019,
                "origin_country": [
                    "GB"
                ],
                "original_language": "en",
                "original_name": "Big Brother: Live Stream",
                "overview": "Big Brother sees it all - and so can you.",
                "popularity": 1621.549,
                "poster_path": "/sYuUb7W2DyLux7paqF4Oob3z2bF.jpg",
                "first_air_date": "2023-10-08",
                "name": "Big Brother: Live Stream",
                "vote_average": 0.0,
                "vote_count": 0
            },
            {
                "adult": false,
                "backdrop_path": "/iMFYIuKTEf3eRegVNAJbRkz64wb.jpg",
                "genre_ids": [
                    18,
                    80
                ],
                "id": 3034,
                "origin_country": [
                    "DE",
                    "AT",
                    "CH"
                ],
                "original_language": "de",
                "original_name": "Tatort",
                "overview": "Tatort is a long-running German/Austrian/Swiss, crime television series set in various parts of these countries. The show is broadcast on the channels of ARD in Germany, ORF 2 in Austria and SF1 in Switzerland.",
                "popularity": 972.703,
                "poster_path": "/sqGAH4Koj0poDi65arOK14rTDVu.jpg",
                "first_air_date": "1970-11-29",
                "name": "Scene of the Crime",
                "vote_average": 6.157,
                "vote_count": 99
            },
            {
                "adult": false,
                "backdrop_path": "/65Y6PweSvQ1OOFBzStybjipURRP.jpg",
                "genre_ids": [
                    80,
                    18,
                    9648
                ],
                "id": 4057,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "Criminal Minds",
                "overview": "An elite team of FBI profilers analyze the country's most twisted criminal minds, anticipating their next moves before they strike again. The Behavioral Analysis Unit's most experienced agent is David Rossi, a founding member of the BAU who returns to help the team solve new cases.",
                "popularity": 1399.129,
                "poster_path": "/7TCwgX7oQKxcWYEhSPRmaHe6ULN.jpg",
                "first_air_date": "2005-09-22",
                "name": "Criminal Minds",
                "vote_average": 8.322,
                "vote_count": 3440
            },
            {
                "adult": false,
                "backdrop_path": "/mc3rG5M9dFVjMfaCFNfbD5gu2pK.jpg",
                "genre_ids": [
                    16,
                    35
                ],
                "id": 1433,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "American Dad!",
                "overview": "The series focuses on an eccentric motley crew that is the Smith family and their three housemates: Father, husband, and breadwinner Stan Smith; his better half housewife, Francine Smith; their college-aged daughter, Hayley Smith; and their high-school-aged son, Steve Smith. Outside of the Smith family, there are three additional main characters, including Hayley's boyfriend turned husband, Jeff Fischer; the family's man-in-a-goldfish-body pet, Klaus; and most notably the family's zany alien, Roger, who is full of masquerades, brazenness, and shocking antics.",
                "popularity": 2050.153,
                "poster_path": "/xnFFz3etm1vftF0ns8RMHA8XdqT.jpg",
                "first_air_date": "2005-02-06",
                "name": "American Dad!",
                "vote_average": 6.953,
                "vote_count": 1886
            },
            {
                "adult": false,
                "backdrop_path": "/7FFeWCB2EcBpmsBMHKat7TSqSJw.jpg",
                "genre_ids": [],
                "id": 30048,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "Tony Awards",
                "overview": "The Antoinette Perry Award for Excellence in Theatre, more commonly known as a Tony Award, recognizes achievement in live Broadway theatre. The awards are presented by the American Theatre Wing and The Broadway League at an annual ceremony in New York City. The awards are given for Broadway productions and performances, and an award is given for regional theatre.",
                "popularity": 1188.097,
                "poster_path": "/6BXIIGyl9MQiJhkxcGCcrcoAzMz.jpg",
                "first_air_date": "1956-04-01",
                "name": "Tony Awards",
                "vote_average": 5.0,
                "vote_count": 8
            }
        ],
        "total_pages": 7936,
        "total_results": 158711
    }
""".data(using: .utf8)

func getTvShowResponse() -> MovieModel? {
    let response: MovieModel?
    do {
        guard let data = TvShowJsonResponse else {
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

