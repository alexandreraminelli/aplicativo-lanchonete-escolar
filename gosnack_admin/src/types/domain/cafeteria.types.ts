import { Timestamp } from "firebase/firestore"

/** Modelo de dados para lanchonetes. */
export interface CafeteriaModel {
  /** ID da lanchonete no Firestore. */
  id: string
  /** Nome da lanchonete. */
  name: string
  /** Localização da lanchonete dentro da escola. */
  location: string
  /** Telefones de contato da lanchonete. */
  phones?: string[]
  /** Horários de funcionamento da lanchonete. */
  openingHours: OpeningHours

  /** Se a lanchonete está ativa. */
  isActive: boolean
  /** Data de criação da lanchonete no sistema. */
  createdAt: Timestamp
  /** Data da última atualização dos dados da lanchonete. */
  updatedAt: Timestamp
}

/** Modelo de dados para cadastro de lanchonete. */
export type CafeteriaInputModel = Omit<CafeteriaModel, "id" | "createdAt" | "updatedAt">

/** Grupos de dias de funcionamento da lanchonete. */
export type OpeningHoursGroup = "weekdays" | "saturday"

/** Intervalo de horário. */
export interface TimeRange {
  /** Se a lanchonete abre nesse período. */
  isOpen: boolean
  /** Horário de abertura (formato HH:mm). */
  openingTime: string
  /** Horário de fechamento (formato HH:mm). */
  closingTime: string
}

/** Horários de funcionamento da lanchonete. */
export interface OpeningHours {
  /** Segunda a sexta. */
  weekdays: TimeRange
  /** Sábado (opcional). */
  saturday?: TimeRange
}
