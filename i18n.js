
/*console.log(VERSION);
console.log(GAMEMODE_CODE);
console.log(CREATION_DATE);*/

const translations = {
    CREDIT: {
        "en-US": "Tower Meifense v##VERSION## by Zezombye | discord.gg/YP544CH",
        "zh-CN": "小美塔防，版本号v##VERSION##，由Zezombye制作 | discord.gg/YP544CH"
    },
    SERVER_LOAD: {
        "en-US": "Server load: {} | peak: {} | avg: {} | effects: {}\nCode: ##CODE##\n",
        "zh-CN": "服务器负载：{} | 服务器峰值：{} | 服务器平均：{} | 效果：{}\n代码：##CODE##\n",
        "format": "getServerLoad(), getPeakServerLoad(), getAverageServerLoad(), getNumberOfEntityIds()",
        "plaintext": true,
    },
    MEIS_ALIVE: {
        "en-US": "Meis alive: {}",
        "zh-CN": "存活的小美：{}",
        "format": "len(getLivingPlayers(Team.2))",
    },
    SCORE: {
        "en-US": "Score: {}",
        "zh-CN": "分数：{}",
        "format": "score",
    },
    HIGH_SCORE: {
        "en-US": "High score: {}",
        "zh-CN": "高分：{}",
        "format": "max(score, highScore)",
    },
    SETUP: {
        "en-US": " \n\n\n\n\n\n\n\n                            ----Setup----\n\nPlease put 5 *hard* mei bots in team 2.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
        "zh-CN": " \n\n\n\n\n\n\n\n                            ----配置方法----\n\n请选择5个*困难难度*的小美机器人放进队伍2中。\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
        "plaintext": true,
    },
    SETUP_DONE: {
        "en-US": "                                                Everything is good!\nYou can now start the game if you have enough human players.",
        "zh-CN": "                         一切准备就绪！\n你现在可以在玩家数量足够之后手动开始游戏。",
        "plaintext": true,
    },
    "OBJ_DESC_1": {
        "en-US": "Let's make this right as rein.",
        "zh-CN": "这就来搞定这群小美。",
        "plaintext": true
    },
    "OBJ_DESC_2": {
        "en-US": "Let's go, fellas.",
        "zh-CN": "伙计们，上吧。",
        "plaintext": true
    },
    "OBJ_DESC_3": {
        "en-US": "Let's move out!",
        "zh-CN": "快上！",
        "plaintext": true
    },
    "OBJ_DESC_4": {
        "en-US": "Let's move out.",
        "zh-CN": "快上。",
        "plaintext": true
    },
    "OBJ_DESC_5": {
        "en-US": "Remove any doubts in your head; it's us, or them.",
        "zh-CN": "别再留有任何怀疑的想法，要么是我们活下去，要么是她们。",
        "plaintext": true
    },
    "OBJ_DESC_6": {
        "en-US": "Remember! This isn't the practice range anymore! This is real life.",
        "zh-CN": "记好了！这可不是训练场！这就是现在正在发生的袭击。",
        "plaintext": true
    },
    "OBJ_DESC_7": {
        "en-US": "Watch out. These meis have got a bit of an arsenal and they don't mind using it!",
        "zh-CN": "小心带你。这些小美的装备非常精良，而且她们会对你毫不留情！",
        "plaintext": true
    },
    "OBJ_DESC_8": {
        "en-US": "Let's have it, lads!",
        "zh-CN": "走起来，伙计！",
        "plaintext": true
    },
    "OBJ_DESC_9": {
        "en-US": "Let's give it to them, boys!",
        "zh-CN": "上吧小伙子们，给她们瞧瞧我们的厉害！",
        "plaintext": true
    },
    "OBJ_DESC_10": {
        "en-US": "Let's show them who we are!",
        "zh-CN": "让她们记住我们的名字！",
        "plaintext": true
    },
    "OBJ_DESC_11": {
        "en-US": "Are we rushing in? Or are we going sneaky-beaky like?",
        "zh-CN": "我们是直接狂轰滥炸？还是悄悄摸摸的开打？",
        "plaintext": true
    },
    "OBJ_DESC_12": {
        "en-US": "For Mercy and Widow, men!",
        "zh-CN": "为了天使姐姐和黑百合姐姐而战，诸位！",
        "plaintext": true
    },
    "OBJ_DESC_13": {
        "en-US": "Remember! This is bandit country. Shoot everything that moves.",
        "zh-CN": "各位！这是个危险的地方，对一切能动的玩意开火。",
        "plaintext": true
    },
    "OBJ_DESC_14": {
        "en-US": "Gear up! We're going in!",
        "zh-CN": "拿上装备！我们上了！",
        "plaintext": true
    },
    "OBJ_DESC_15": {
        "en-US": "We are out of here!",
        "zh-CN": "我们要从这打出去！",
        "plaintext": true
    },
    "OBJ_DESC_16": {
        "en-US": "We're on!",
        "zh-CN": "我们上！",
        "plaintext": true
    },
    "OBJ_DESC_17": {
        "en-US": "Right lads, we're on.",
        "zh-CN": "好了伙计们，我们要开火了。",
        "plaintext": true
    },
    "OBJ_DESC_18": {
        "en-US": "These fellas are gonna regret waking up this morning.",
        "zh-CN": "这群小美们马上就要后悔今早其实不该起床。",
        "plaintext": true
    },
    "OBJ_DESC_19": {
        "en-US": "They're gonna wish they were never born.",
        "zh-CN": "这群小美马上就会希望自己没生下来。",
        "plaintext": true
    },
    "OBJ_DESC_20": {
        "en-US": "Let's have at it, mates!",
        "zh-CN": "大伙们，冲啊，杀啊！",
        "plaintext": true
    },
    "OBJ_DESC_21": {
        "en-US": "Gear up! We are going on a freezing walk here!",
        "zh-CN": "拿上装备！我们要开始冰上芭蕾了！",
        "plaintext": true
    },
    MEIS_WIN: {
        "en-US": "Meis win",
        "zh-CN": "小美获胜",
    },
    ANTI_CRASH: {
        "en-US": "Anti-crash system activated",
        "zh-CN": "启动应急反崩溃系统",
    },
    WAVE_XXX_1: {
        "en-US": "Wave ",
        "zh-CN": "第",
    },
    WAVE_XXX_2: {
        "en-US": "",
        "zh-CN": "波"
    },
    WAVE_XXX_3: {
        "en-US": "/9",
        "zh-CN": "/9"
    },
    ADDITIONAL_POINTS: {
        "en-US": " points (defense bonus)",
        "zh-CN": "分（防守加成）"
    },
    MEI: {
        "en-US": "Mei",
        "zh-CN": "小美"
    },
    MEI_TANK: {
        "en-US": "Meircenary",
        "zh-CN": "重甲小美"
    },
    MEI_TANK_SNIPER: {
        "en-US": "Meirciless",
        "zh-CN": "重甲狙击手小美"
    },
    MEI_HEALER: {
        "en-US": "Meidic",
        "zh-CN": "医疗兵小美"
    },
    MEI_SPEEDY: {
        "en-US": "Meilicious",
        "zh-CN": "飞奔小美"
    },
    MEI_SNIPER: {
        "en-US": " Meirine ",
        "zh-CN": "狙击手小美",
        plaintext: true,
    },
    MEI_ULT: {
        "en-US": "Meigalomaniac",
        "zh-CN": "终极小美"
    },
    MEI_SPEED_BOSS: {
        "en-US": " The Meichine ",
        "zh-CN": "飞毛腿小美",
        plaintext: true,
    },
    /*XXXXX: {
        "en-US": "",
        "fr-FR": ""
    },*/

}

const availableLanguages = ["en-US", "zh-CN"]


//check if we put a language that isn't available
/*for (var key in translations) {
    if (!availableLanguages.includes(key)) {
        throw new Error("Language '"+key+"' is invalid");
    }
}*/

result = "";
for (var translation in translations) {

    //check if all languages are here
    for (var lang of availableLanguages) {
        if (translations[translation][lang] === undefined) {
            throw new Error("Missing language '"+lang+"' for translation '"+translation+"'");
        }
    }

    console.log(translations[translation].format)
    result += "#!define STR_"+translation+" ["+availableLanguages.map(x => (translations[translation].plaintext?"p":"") + JSON.stringify(translations[translation][x]).replace(/##(\w+)##/g, '"$1"') + (translations[translation].format ? ".format("+translations[translation].format+")" : ""))+'][max(false, practiceRangeTranslations.index("{0}".format(Map.PRACTICE_RANGE)))]\n';
}

result
