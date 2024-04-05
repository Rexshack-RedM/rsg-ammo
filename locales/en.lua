local Translations = {

    client = {
        lang_1 = 'Not Holding a Weapon',
        lang_2 = 'Wrong Ammo for Weapon',
        lang_3 = 'Max Ammo Reached',
        lang_4 = 'You are not holding a weapon',
    },

    server = {
        lang_1 = 'add here',
    },

}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

-- Lang:t('client.lang_1')
-- Lang:t('server.lang_1')
