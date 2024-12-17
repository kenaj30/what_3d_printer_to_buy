import customtkinter as ctk
import clips
from tkinter import StringVar

class System:
    def __init__(self):
        self.env = clips.Environment()
        self.env.load('printer.clp')

    def get_facts(self):
        return self.env.facts()

    def set_answer(self, answer):
        self.env.assert_string("(odpowiedz \"" + answer + "\")")

    def go_to_question(self, question):
        for fact in reversed(list(self.env.facts())):
            if "wynik" in str(fact):
                fact.retract()
                continue
            if "pytanie" in str(fact):
                fact.retract()
                continue
            if "odpowiedz" in str(fact):
                fact.retract()
                break
        self.env.assert_string(f'(pytanie {question})')

    def run(self):
        self.env.run()

