import random


def random_search_pick():
    dictionary = {"Search1": "Facebook", "Search2": "Amazon", "Search3": "Asana"}
    random.choice(list(dictionary.values()))
