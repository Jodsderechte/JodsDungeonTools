local _, JDT = ...

JDT.Templates = JDT.Templates  or {}

JDT.Templates.CustomTriggers = JDT.Templates.CustomTriggers  or {}

JDT.Templates.CustomTriggers.EnergyTrackSoonCast = function(spellIdList,extraUnit)

    local trigger = {
        customTrigger = "",
        customEvents = "",
    }
    local spellIds = ""
    for k in pairs(spellIdList) do
        if k ~= 1 then
            spellIds=spellIds.." or "
        end
        spellIds = spellIds.."spellId == "..spellIdList[k]
    end
    
   trigger.customTrigger = "function(s,e,unit,powerType,spellId)\n    if unit == \""..extraUnit.."\" then\n        if e == \"UNIT_POWER_UPDATE\" then\n            if not s[\"\"] then\n                local calculatedDuration = (100-UnitPower(unit))/3 + 1.3\n                s[\"\"] = {\n                    duration = calculatedDuration,\n                    expirationTime = GetTime()+calculatedDuration,\n                    progressType = \"timed\",\n                    autoHide = true,\n                    changed = true,\n                    show = true,\n                }\n                return true\n            else\n                local calculatedDuration = (100-UnitPower(unit))/3 + 1.3\n                if s[\"\"].expirationTime-GetTime() ~= calculatedDuration then\n                    s[\"\"].expirationTime = GetTime()+calculatedDuration\n                    s[\"\"].changed = true\n                    return true\n                end\n                \n            end\n        elseif e == \"UNIT_SPELLCAST_SUCCEEDED\" and "..spellIds.." then\n            if s[\"\"] then\n                s[\"\"].show = false\n                s[\"\"].changed = true\n                return true\n            end\n            \n        end\n    end\n    \nend\n\n\n"
   trigger.customEvents = "UNIT_POWER_UPDATE:"..extraUnit..", UNIT_SPELLCAST_SUCCEEDED"

    return trigger
end


JDT.Templates.CustomTriggers.TazaveshDispose = function(spellIdList,extraUnit)
    local trigger = {
        customTrigger = "function(s,event,_,subevent,_,_,_,_,_,destGUID,_,_,_,spellID)\n    \n    if subevent == \"SPELL_SUMMON\" and spellID == 346381 then\n        if not s[\"\"] then\n            \n            s[\"\"] = {\n                duration = 30,\n                expirationTime = GetTime()+30,\n                stacks = 1,\n                progressType = \"timed\",\n                autoHide = true,\n                changed = true,\n                show = true,\n            }\n        else\n            s[\"\"].stacks = s[\"\"].stacks+1\n            s[\"\"].changed = true\n            s[\"\"].expirationTime = GetTime()+30\n        end\n        \n        return true\n        \n        \n    elseif subevent == \"SPELL_AURA_REMOVED\" and spellID == 346296 then\n        \n        if s[\"\"] then\n            \n            s[\"\"].stacks = s[\"\"].stacks-1\n            if s[\"\"].stacks == 0 then\n                s[\"\"].show = false\n            end\n            s[\"\"].changed = true\n            return true \n        end\n        \n    end\nend",
        customEvents = "COMBAT_LOG_EVENT_UNFILTERED:Spell_Summon,COMBAT_LOG_EVENT_UNFILTERED:Spell_Aura_Removed",
        customVariables = "{\n    expirationTime = true,\n    duration = true,\n    stacks = true,\n}",
    }
    return trigger
end

