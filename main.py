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


class App(ctk.CTk):
    question_label = None
    answers = None
    next_button = None
    previous_button = None

    checkboxes = []

    question_string = ""
    answers_list = []

    questions_history = []

    finished = False

    def setup_controls(self):
        self.load_answers_box()
        self.load_next_button()
        self.load_previous_button()

    def __init__(self):
        super().__init__()

        self.title("What 3D printer to buy?")
        self.geometry("600x400")
        ctk.set_appearance_mode("dark")
        ctk.set_default_color_theme("green")

        self.env = System()
        self.selected_checkbox = ctk.IntVar()

        self.grid_rowconfigure(0, weight=1)
        self.grid_columnconfigure((0, 1, 2), weight=1)

        self.setup_controls()
        self.load_expert_system_data()

    def load_next_button(self):
        if self.next_button is None:
            self.next_button = ctk.CTkButton(
                master=self, text="Next", command=self.next_button_callback,
                fg_color="#00A896", hover_color="#028090", corner_radius=20
            )
            self.next_button.grid(row=3, column=2, padx=20, pady=20, sticky="ew")
        elif not self.finished:
            self.next_button.configure(text="Next", command=self.next_button_callback)
        else:
            self.next_button.configure(text="Exit", command=self.close_button_callback)

    def load_previous_button(self):
        if self.previous_button is None:
            self.previous_button = ctk.CTkButton(
                master=self, text="Back", command=self.previous_button_callback,
                fg_color="#EE6C4D", hover_color="#E63946", corner_radius=20
            )
            self.previous_button.grid(row=3, column=0, padx=20, pady=20, sticky="ew")

    def load_answers_box(self):
        if self.answers is None:
            self.answers = ctk.CTkFrame(master=self, fg_color="#1c1c1c", corner_radius=15)
            self.answers.grid(row=1, column=0, columnspan=3, padx=20, pady=20, sticky="nsew")

    def show_answers(self, answers):
        if self.next_button:
            self.next_button.configure(state="disabled")
        self.selected_checkbox.set(-1)

        for checkbox in self.checkboxes:
            checkbox.destroy()

        self.checkboxes = []

        for i, answer in enumerate(answers):
            checkbox = ctk.CTkRadioButton(
                master=self.answers, text=answer, value=i,
                variable=self.selected_checkbox, command=self.checkbox_selected,
                text_color="white"
            )
            checkbox.pack(pady=5, anchor="w")
            self.checkboxes.append(checkbox)

    def checkbox_selected(self):
        if self.next_button:
            self.next_button.configure(state="normal")

    def show_question(self, question):
        if self.question_label is None:
            self.question_label = ctk.CTkLabel(
                master=self, text=question, font=("Arial", 20, "bold"),
                text_color="white", anchor="center", wraplength=500
            )
            self.question_label.grid(row=0, column=0, columnspan=3, padx=20, pady=20, sticky="nsew")
        else:
            self.question_label.configure(text=question)

    def close_button_callback(self):
        self.quit()

    def previous_button_callback(self):
        if self.questions_history:
            question = self.questions_history.pop()
            if self.finished:
                self.finished = False
                self.next_button.configure(text="Next", command=self.next_button_callback)
                self.setup_controls()
            self.env.go_to_question(question)
            self.load_expert_system_data()

    def next_button_callback(self):
        answers = ' '.join([f'"{x}"' for x in self.answers_list])
        self.questions_history.append(f'"{self.question_string}" {answers}')
        self.env.set_answer(self.question_string + "\" \"" + self.answers_list[self.selected_checkbox.get()])
        self.load_expert_system_data()

    def finish(self, result):
        self.next_button.configure(text="Exit", command=self.close_button_callback)
        for checkbox in self.checkboxes:
            checkbox.destroy()
        self.checkboxes = []
        self.answers.destroy()
        self.answers = None
        self.show_question(f'You should buy this printer: "{result}"')
        self.finished = True

    def load_expert_system_data(self):
        self.env.run()
        for fact in self.env.get_facts():
            if fact.template.name == "pytanie":
                self.question_string = fact[0]
                self.answers_list = [fact[x + 1] for x in range(len(fact) - 1)]
                self.show_question(self.question_string)
                self.show_answers(self.answers_list)
            if fact.template.name == "wynik":
                self.finish(fact[0])

        if self.questions_history:
            self.previous_button.configure(state="normal")
        else:
            self.previous_button.configure(state="disabled")


if __name__ == "__main__":
    app = App()
    app.mainloop()