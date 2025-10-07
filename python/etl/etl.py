def transform(legacy_data):
    dict = {}
    for key in legacy_data.keys():
        values = legacy_data[key]
        for value in values:
            dict[value.lower()] = key
    return dict

