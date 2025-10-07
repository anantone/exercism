def transform(legacy_data):
    keys = legacy_data.keys()
    values = legacy_data.values()
    dict = {}
    for key in keys:
        values = legacy_data[key]
        for value in values:
            dict[value.lower()] = key
    return dict