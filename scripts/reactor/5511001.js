/* @Author SharpAceX
* 5511001.js: Summons Scarlion.
*/

function act() {
	if (rm.getReactor().getMap().getMonsterById(9420547) == null) {
		rm.spawnMonster(9420547,-238,636);

		rm.mapMessage(6, "Beware! The furious Scarlion has shown himself!");
		rm.createMapMonitor(551000000,"sp");
	}
}