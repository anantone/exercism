def transform(legacy_data):
    return {value.lower():key for key in legacy_data for value in legacy_data[key]}
