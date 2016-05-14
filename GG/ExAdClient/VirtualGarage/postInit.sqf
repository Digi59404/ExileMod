/*  
	postInit.sqf
	
	Copyright 2016 Jan Babor

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.

*/

execVM "GG\ExAdClient\VirtualGarage\customize.sqf";

if(isNil "ExAd_VG_MIN_ALLOWED_VEH")then{ExAd_VG_MIN_ALLOWED_VEH = 5;};
if(isNil "ExAd_VG_ALLOWED_VEH_MULTIPLE_FACTOR")then{ExAd_VG_ALLOWED_VEH_MULTIPLE_FACTOR = 3;};
if(isNil "ExAd_VG_ACCESS_LEVEL")then{ExAd_VG_ACCESS_LEVEL = 1;};
if(isNil "ExAd_VG_CLEAN_ON_STORE")then{ExAd_VG_CLEAN_ON_STORE = true;};
if(isNil "ExAd_VG_SHOW_ADVHINT")then{ExAd_VG_SHOW_ADVHINT = false;};