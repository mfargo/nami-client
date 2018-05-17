//
//  NMSettings.swift
//  NamiClient
//
//  Created by Matthew Fargo on 2018/05/16.
//  Copyright © 2018年 Matthew Fargo. All rights reserved.
//

import Foundation


class NMSettings {
    static let user_id = 5
    
    static let baseUrl = "10.12.128.168:7373/user/"
    
    static var user:[String:Any] {
        return users[user_id]
    }
    static var user_age:Int {
        return user["age"] as! Int
    }
    static var user_name:String {
        return user["name"] as! String
    }
    static let users = [
        [
            "name":"大池 雄太",
            "age": 38
        ],
        [
            "name":"照井 佳子",
            "age": 31
        ],
        [
            "name":"兼次 龍馬",
            "age": 42
        ],
        [
            "name":"吉田 智枝",
            "age": 57
        ],
        [
            "name": "今関 秀人",
            "age": 24
        ],
        [
            "name":"冨塚 美雨",
            "age": 22
        ],
        [
            "name":"尾辻 哲司",
            "age": 29
        ],
        [
            "name": "岩坪 真夕子",
            "age": 47
        ]
    ]
    static let categories:[[String:Any]] = [
        [
            "id":0,
            "name":"健康",
            "points": [
                [
                    "name":"１日の平均歩数",
                    "unit":"歩",
                    "min":0,
                    "max":30000
                ],
                [
                    "name":"平均心拍数",
                    "unit":"BPM",
                    "min":50,
                    "max":120
                ]
            ]
        ],
        [
            "id":1,
            "name":"満足度",
            "points": [
                [
                    "name":"朝のやる気",
                    "ticks":["まったくない","ない","少し不足","標準","少々","ある","とてもある"]
                ],
                [
                    "name":"振り返ってのやり甲斐",
                    "ticks":["まったくなかった","なかった","少し不足","標準","少々","ある","とてもあった"]
                ]
            ]
        ],
        [
            "id":2,
            "name":"集中",
            "points": [
                [
                    "name":"携帯を眺めている時間",
                    "unit":"時間",
                    "min": 0,
                    "max": 8
                ],
                [
                    "name":"仕事以外のHPを見ている時間",
                    "unit":"時間",
                    "min": 0,
                    "max": 6
                ]
            ]
        ],
        [
            "id":3,
            "name":"労働時間",
            "points": [
                [
                    "name":"平均の出社時間",
                    "unit":":00",
                    "min": 4,
                    "max": 14
                ],
                [
                    "name":"平均の退社時間",
                    "unit":":00",
                    "min": 14,
                    "max": 24
                ]
            ]
        ],
        [
            "id":4,
            "name":"コミュニケーション",
            "points": [
                [
                    "name":"平均の返信速度",
                    "unit":"時間",
                    "min": 0,
                    "max": 40
                ],
                [
                    "name":"Slackの部内メッセージ数",
                    "unit":"件",
                    "min": 0,
                    "max": 100
                ]
            ]
        ],
        [
            "id":5,
            "name":"忙しさ",
            "points": [
                [
                    "name":"メールの１日の送信数",
                    "unit":"件",
                    "min": 0,
                    "max": 40
                ],
                [
                    "name":"メールの既読率",
                    "unit":"%",
                    "min": 0,
                    "max": 100
                ]
            ]
        ]
    ]
    

}
