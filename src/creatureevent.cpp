//////////////////////////////////////////////////////////////////////
// OpenTibia - an opensource roleplaying game
//////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
//////////////////////////////////////////////////////////////////////
#include "otpch.h"

#include "creatureevent.h"
#include "tools.h"
#include "player.h"
#include <sstream>

CreatureEvents::CreatureEvents() :
m_scriptInterface("CreatureScript Interface")
{
	m_scriptInterface.initState();
}

CreatureEvents::~CreatureEvents()
{
	CreatureEventList::iterator it;
	for(it = m_creatureEvents.begin(); it != m_creatureEvents.end(); ++it)
		delete it->second;
}

void CreatureEvents::clear()
{
	//clear all events
	CreatureEventList::iterator it = m_creatureEvents.begin();
	while(it != m_creatureEvents.end()){
		delete it->second;
		m_creatureEvents.erase(it);
		it = m_creatureEvents.begin();
	}

	//clear lua state
	m_scriptInterface.reInitState();
}

LuaScriptInterface& CreatureEvents::getScriptInterface()
{
	return m_scriptInterface;
}

std::string CreatureEvents::getScriptBaseName()
{
	return "creaturescripts";
}

Event* CreatureEvents::getEvent(const std::string& nodeName)
{
	if(asLowerCaseString(nodeName) == "event"){
		return new CreatureEvent(&m_scriptInterface);
	}
	return NULL;
}

bool CreatureEvents::registerEvent(Event* event, xmlNodePtr p)
{
	CreatureEvent* creatureEvent = dynamic_cast<CreatureEvent*>(event);
	if(!creatureEvent)
		return false;

	switch(creatureEvent->getEventType())
	{
		case CREATURE_EVENT_NONE:
			std::cout << "Error: [CreatureEvents::registerEvent] Trying to register event without type!." << std::endl;
			return false;
			break;
		//events are stored in a std::map
		default:
		{
			m_creatureEvents[creatureEvent->getName()] = creatureEvent;
			return true;
		}
	}
}

CreatureEvent* CreatureEvents::getEventByName(const std::string& name)
{
	CreatureEventList::iterator it = m_creatureEvents.find(name);
	if(it != m_creatureEvents.end())
			return it->second;

	return NULL;
}


//Global events
bool CreatureEvents::playerLogIn(Player* player)
{
	for(CreatureEventList::iterator it = m_creatureEvents.begin(); it != m_creatureEvents.end(); ++it)
	{
		if(it->second->getEventType() == CREATURE_EVENT_LOGIN){
			if(!it->second->executeOnLogin(player))
				return false;
		}
	}

	return true;
}

bool CreatureEvents::playerLogOut(Player* player)
{
	for(CreatureEventList::iterator it = m_creatureEvents.begin(); it != m_creatureEvents.end(); ++it)
	{
		if(it->second->getEventType() == CREATURE_EVENT_LOGOUT){
			if(!it->second->executeOnLogout(player))
				return false;
		}
	}

	return true;
}

/////////////////////////////////////

CreatureEvent::CreatureEvent(LuaScriptInterface* _interface) :
Event(_interface)
{
	m_type = CREATURE_EVENT_NONE;
}

CreatureEvent::~CreatureEvent()
{
	//
}

bool CreatureEvent::configureEvent(xmlNodePtr p)
{
	std::string str;
	//Name that will be used in monster xml files and
	// lua function to register events to reference this event
	if(readXMLString(p, "name", str)){
		m_eventName = str;
	}
	else{
		std::cout << "Error: [CreatureEvent::configureEvent] No name for creature event." << std::endl;
		return false;
	}

	if(readXMLString(p, "type", str)){
		if(asLowerCaseString(str) == "login"){
			m_type = CREATURE_EVENT_LOGIN;
		}
		else if(asLowerCaseString(str) == "logout"){
			m_type = CREATURE_EVENT_LOGOUT;
		}
		else if(asLowerCaseString(str) == "die"){
			m_type = CREATURE_EVENT_DIE;
		}
		else if(asLowerCaseString(str) == "kill"){
			m_type = CREATURE_EVENT_KILL;
		}
		else if(asLowerCaseString(str) == "advance"){
			m_type = CREATURE_EVENT_ADVANCE;
		}
		else{
			std::cout << "Error: [CreatureEvent::configureEvent] No valid type for creature event." << str << std::endl;
			return false;
		}
	}
	else{
		std::cout << "Error: [CreatureEvent::configureEvent] No type for creature event."  << std::endl;
		return false;
	}

	return true;
}

std::string CreatureEvent::getScriptEventName()
{
	//Depending on the type script event name is different
	switch(m_type){
	case CREATURE_EVENT_LOGIN:
		return "onLogin";
		break;
	case CREATURE_EVENT_LOGOUT:
		return "onLogout";
		break;
	case CREATURE_EVENT_DIE:
		return "onDie";
		break;
	case CREATURE_EVENT_KILL:
		return "onKill";
		break;
	case CREATURE_EVENT_ADVANCE:
		return "onAdvance";
		break;
	case CREATURE_EVENT_NONE:
	default:
		return "";
		break;
	}
}

bool CreatureEvent::executeOnLogin(Player* player)
{
	//onLogin(cid)
	if(m_scriptInterface->reserveScriptEnv()){
		ScriptEnviroment* env = m_scriptInterface->getScriptEnv();

		#ifdef __DEBUG_LUASCRIPTS__
		std::stringstream desc;
		desc << player->getName();
		env->setEventDesc(desc.str());
		#endif

		env->setScriptId(m_scriptId, m_scriptInterface);
		env->setRealPos(player->getPosition());

		uint32_t cid = env->addThing(player);

		lua_State* L = m_scriptInterface->getLuaState();

		m_scriptInterface->pushFunction(m_scriptId);
		lua_pushnumber(L, cid);

		bool result = m_scriptInterface->callFunction(1);
		m_scriptInterface->releaseScriptEnv();

		return result;
	}
	else{
		std::cout << "[Error] Call stack overflow. CreatureEvent::executeOnLogin" << std::endl;
		return 0;
	}
}

bool CreatureEvent::executeOnLogout(Player* player)
{
	//onLogout(cid)
	if(m_scriptInterface->reserveScriptEnv()){
		ScriptEnviroment* env = m_scriptInterface->getScriptEnv();

		#ifdef __DEBUG_LUASCRIPTS__
		std::stringstream desc;
		desc << player->getName();
		env->setEventDesc(desc.str());
		#endif

		env->setScriptId(m_scriptId, m_scriptInterface);
		env->setRealPos(player->getPosition());

		uint32_t cid = env->addThing(player);

		lua_State* L = m_scriptInterface->getLuaState();

		m_scriptInterface->pushFunction(m_scriptId);
		lua_pushnumber(L, cid);

		bool result = m_scriptInterface->callFunction(1);
		m_scriptInterface->releaseScriptEnv();

		return result;
	}
	else{
		std::cout << "[Error] Call stack overflow. CreatureEvent::executeOnLogout" << std::endl;
		return 0;
	}
}

void CreatureEvent::executeOnDie(Creature* creature, Item* corpse)
{
	//onDie(cid, corpse)
	if(m_scriptInterface->reserveScriptEnv()){
		ScriptEnviroment* env = m_scriptInterface->getScriptEnv();

		#ifdef __DEBUG_LUASCRIPTS__
		std::stringstream desc;
		desc << creature->getName();
		env->setEventDesc(desc.str());
		#endif

		env->setScriptId(m_scriptId, m_scriptInterface);
		env->setRealPos(creature->getPosition());

		uint32_t cid = env->addThing(creature);
		uint32_t corpseid = env->addThing(corpse);

		lua_State* L = m_scriptInterface->getLuaState();

		m_scriptInterface->pushFunction(m_scriptId);
		lua_pushnumber(L, cid);
		lua_pushnumber(L, corpseid);

		m_scriptInterface->callFunction(2, false);
		m_scriptInterface->releaseScriptEnv();
	}
	else{
		std::cout << "[Error] Call stack overflow. CreatureEvent::executeOnDie" << std::endl;
	}
}

void CreatureEvent::executeOnKill(Creature* creature, Creature* target, bool lastHit)
{
	//onKill(cid, target, lasthit)
	if(m_scriptInterface->reserveScriptEnv()){
		ScriptEnviroment* env = m_scriptInterface->getScriptEnv();

		#ifdef __DEBUG_LUASCRIPTS__
		std::stringstream desc;
		desc << creature->getName();
		env->setEventDesc(desc.str());
		#endif

		env->setScriptId(m_scriptId, m_scriptInterface);
		env->setRealPos(creature->getPosition());

		uint32_t cid = env->addThing(creature);
		uint32_t targetId = env->addThing(target);

		lua_State* L = m_scriptInterface->getLuaState();

		m_scriptInterface->pushFunction(m_scriptId);
		lua_pushnumber(L, cid);
		lua_pushnumber(L, targetId);
		lua_pushboolean(L, (lastHit ? true : false) );

		m_scriptInterface->callFunction(3, false);
		m_scriptInterface->releaseScriptEnv();
	}
	else{
		std::cout << "[Error] __ENABLE_SERVER_DIAGNOSTIC__Call stack overflow. CreatureEvent::executeOnKill" << std::endl;
	}
}

void CreatureEvent::executeOnAdvance(Player* player, levelTypes_t type, uint32_t oldLevel, uint32_t newLevel)
{
	//onAdvance(cid, type, oldlevel, newlevel)
	if(m_scriptInterface->reserveScriptEnv()){
		ScriptEnviroment* env = m_scriptInterface->getScriptEnv();

		#ifdef __DEBUG_LUASCRIPTS__
		std::stringstream desc;
		desc << player->getName();
		env->setEventDesc(desc.str());
		#endif

		env->setScriptId(m_scriptId, m_scriptInterface);
		env->setRealPos(player->getPosition());

		uint32_t cid = env->addThing(player);

		lua_State* L = m_scriptInterface->getLuaState();

		m_scriptInterface->pushFunction(m_scriptId);
		lua_pushnumber(L, cid);
		lua_pushnumber(L, (uint32_t)type);
		lua_pushnumber(L, oldLevel);
		lua_pushnumber(L, newLevel);

		m_scriptInterface->callFunction(4, false);
		m_scriptInterface->releaseScriptEnv();

	}
	else{
		std::cout << "[Error] Call stack overflow. CreatureEvent::executeOnAdvance" << std::endl;
	}
}