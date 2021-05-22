class FavoritesPost {
	List<Data> data;
	Meta meta;

	FavoritesPost({this.data, this.meta});

	FavoritesPost.fromJson(Map<String, dynamic> json) {
		meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
		if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
		return data;
	}
}

class Data {


	Data();

	Data.fromJson(Map<String, dynamic> json) {
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		return data;
	}
}

class Meta {
	int currentPage;
	Null from;
	int lastPage;
	String path;
	int perPage;
	Null to;
	int total;

	Meta({this.currentPage, this.from, this.lastPage, this.path, this.perPage, this.to, this.total});

	Meta.fromJson(Map<String, dynamic> json) {
		currentPage = json['current_page'];
		from = json['from'];
		lastPage = json['last_page'];
		path = json['path'];
		perPage = json['per_page'];
		to = json['to'];
		total = json['total'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['current_page'] = this.currentPage;
		data['from'] = this.from;
		data['last_page'] = this.lastPage;
		data['path'] = this.path;
		data['per_page'] = this.perPage;
		data['to'] = this.to;
		data['total'] = this.total;
		return data;
	}
}


