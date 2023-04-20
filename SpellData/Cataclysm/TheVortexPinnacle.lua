local _, JDT = ...

JDT.SpellList = JDT.SpellList or {}
JDT.SpellList.Cataclysm = JDT.SpellList.Cataclysm or {}
JDT.SpellList.Cataclysm.Dungeons = JDT.SpellList.Cataclysm.Dungeons or {}


JDT.SpellList.Cataclysm.Dungeons.VortexPinnacle = {
    groupName = "[VP",
    zoneId = "325", -- https://wowpedia.fandom.com/wiki/UiMapID   C_Map.GetMapGroupID(dungeonAreaMapID)
    EncounterJournalID = 68, -- https://wow.tools/dbc/?dbc=journalencounter&build=10.0.2.45632
    Bosses = {}
}
local bosses = JDT.SpellList.Cataclysm.Dungeons.VortexPinnacle.Bosses

--Rira Hackclaw
bosses.boss1 = {  -- 	Altairus
    EncounterId = "1041", -- https://wowpedia.fandom.com/wiki/DungeonEncounterID
    additionalName = "] 01 ",
    Auras = { 
       
        [JDT.GroupTypes.HasteBuff] = {
            UpwindofAltairus = {
                enabled = true,
                spellId = 88282,
                triggerData = {
                    {
                        unit = JDT.Templates.Triggers.UnitTypes.player,
                        spellId = "88282",
                    }

                }
            },
        },
        [JDT.Templates.GroupTypes.SlowDot] = {
            DownwindOfAltairus = {
                enabled = true,
                spellId = 88286,
                triggerData = {
                    {
                        unit = JDT.Templates.Triggers.UnitTypes.player,
                        spellId = "88286",
                    }

                }
            },
        },
        
        [JDT.GroupTypes.Frontal] = {
            ChillingBreath = {
                enabled = true,
                spellId = 88308,
                triggerData = {
                    {
                        unit = JDT.Templates.Triggers.UnitTypes.boss,
                        spellId = "88308",
                    }

                }
            },

        },
       
    }
}

bosses.boss2 = {  -- Asaad
    EncounterId = "1042", -- https://wowpedia.fandom.com/wiki/DungeonEncounterID
    additionalName = "] 02 ",
    Auras = { 
        [JDT.GroupTypes.CastWithSafeDeBuffDuringCast] ={
            UnstableGroundingField = {
                enabled = true,
                spellId = 86911, -- for spellname etc
                extraName = " active",
                triggerData = {
                    {
                        unit = JDT.Templates.Triggers.UnitTypes.player,
                        spellId = "87726",
                    },
                    {
                        unit = JDT.Templates.Triggers.UnitTypes.boss,
                        spellId = "86911",
                    },
        
                }
            }
        },
        [JDT.GroupTypes.SpreadCast] = {
            ChainLightning = {
                enabled = true,
                spellId = 87622,
                triggerData = {
                  {
                        unit = JDT.Templates.Triggers.UnitTypes.boss,
                        spellId = "87622",
                    },

                }
            },
        },
        [JDT.GroupTypes.Jump] ={
            StaticCling = {
                enabled = true,
                spellId = 87618, -- for spellname etc
                triggerData = {
                    {
                        unit = JDT.Templates.Triggers.UnitTypes.boss,
                        spellId = "87618",
    
                    },
    
                }
            },
        },
        [JDT.GroupTypes.SlowDebuff] ={
            StaticCling = {
                enabled = true,
                spellId = 87618, -- for spellname etc
                extraName = " slow",
                triggerData = {
                    {
                        unit = JDT.Templates.Triggers.UnitTypes.player,
                        spellId = "87618",

                    },

                }
            }
        },
        [JDT.GroupTypes.AddSummonCombatlog] = {
            SkyfallNova = {
                enabled = true,
                spellId = 413263,
                triggerData = {
                    {
                        spellId = "96260",
                        duration = "3",
                    },

                }
            },
        },
        [JDT.GroupTypes.KillAddAlive] = {
            SkyfallNova = {
                enabled = true,
                spellId = 413263,
                extraName = " alive",
                triggerData = {
                    {
                        unit = JDT.Templates.Triggers.UnitTypes.nameplate,
                        npcID = "177237",
            
                    },

                }
            },
        },
        
       
    }
}
bosses.boss3 = {  -- 	Grand Vizier Ertan
    EncounterId = "1043", -- https://wowpedia.fandom.com/wiki/DungeonEncounterID
    additionalName = "] 03 ",
    Auras = { 
       
        [JDT.GroupTypes.Dance] ={
            CycloneShield = {
                enabled = true,
                spellId = 86267, -- for spellname etc
                triggerData = {
                    {
                        unit = JDT.Templates.Triggers.UnitTypes.boss,
                        spellId = "86267",
                    },

                }
            }
        },
        [JDT.GroupTypes.InterruptableTargetedCast] ={
            LightningBolt = {
                enabled = true,
                spellId = 188196, -- for spellname etc
                triggerData = {
                     {
                        unit = JDT.Templates.Triggers.UnitTypes.boss,
                        spellId = "188196",

                    },

                }
            },
        },
        [JDT.GroupTypes.AddSummonCast] = {
            SummonTempest = {
                enabled = true,
                spellId = 413151,
                triggerData = {
                    {
                        unit = JDT.Templates.Triggers.UnitTypes.boss,
                        spellId = "413151",
                    },

                }
            },
        },
        [JDT.GroupTypes.LooktoAddCast] = {
            LethalCurrent = {
                enabled = true,
                spellId = 411001,
                triggerData = {
                    {
                        unit = JDT.Templates.Triggers.UnitTypes.boss,
                        spellId = "411001",
                    },

                }
            },
        },
    }
}

bosses.Trash = {
    additionalName = "TRASH] ",
    Auras = { 

    }
}