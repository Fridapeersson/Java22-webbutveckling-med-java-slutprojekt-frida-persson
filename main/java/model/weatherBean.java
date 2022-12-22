package model;

public class weatherBean {

	private String cityStr;

	private String countryStr;

	private String cloudsStr;

	private String lastupdateStr;

	private String windSpeedStr;

	public weatherBean(String cityStr, String countryStr) {

		this.cityStr = cityStr;
		this.countryStr = countryStr;

	}

	public String getCityStr() {
		return cityStr;
	}

	public String getCountryStr() {
		return countryStr;
	}

	public String getCloudsStr() {
		return cloudsStr;
	}

	public void setCloudsStr(String cloudsStr) {
		this.cloudsStr = cloudsStr;
	}

	public String getLastupdateStr() {
		return lastupdateStr;
	}

	public void setLastupdateStr(String lastupdateStr) {
		this.lastupdateStr = lastupdateStr;
	}

	public String getWindSpeedStr() {
		return windSpeedStr;
	}

	public void setWindSpeedStr(String windSpeedStr) {
		this.windSpeedStr = windSpeedStr;
	}

	public void setCountryStr(String countryStr) {
		this.countryStr = countryStr;
	}
}
