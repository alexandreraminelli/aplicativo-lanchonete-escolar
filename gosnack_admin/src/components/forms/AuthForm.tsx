"use client"

import { Field, FieldGroup, FieldLabel } from "@/src/components/ui/field"
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "@/src/components/ui/form"
import { ROUTES } from "@/src/constants/routes"
import { AUTH_TEXTS } from "@/src/constants/texts/auth.texts"
import { signInUser, signUpUser } from "@/src/lib/firebase/auth/auth"
import { SignInInput, SignUpInput } from "@/src/lib/firebase/auth/authInput.types"
import { cn } from "@/src/lib/utils"
import { signInSchema, signUpSchema } from "@/src/utils/validation/schemas/authSchema"
import { zodResolver } from "@hookform/resolvers/zod"
import { type ClassValue } from "clsx"
import { useRouter } from "next/navigation"
import { SubmitHandler, useForm, useWatch } from "react-hook-form"
import { toast } from "sonner"
import z from "zod"
import { Button } from "../ui/button"
import { Input } from "../ui/input"
import { LoaderCircle } from "lucide-react"

/** Tipagem dos dados do form de criar conta. */
type SignUpFormData = z.infer<typeof signUpSchema>
/** Tipagem dos dados do form de login. */
type SignInFormData = z.infer<typeof signInSchema>
/** Tipagem do formulário (Union Type). */
type FormData = SignUpFormData | SignInFormData

/** Props comuns para ambos os tipos de formulário. */
interface BaseProps {
  /** Classes CSS adicionais. */
  className?: ClassValue
}
/** Props de `AuthForm`. */
type Props = BaseProps &
  (
    | {
        // Props para criar conta
        type: "sign-up"
        // onSubmit: (data: z.infer<typeof signUpSchema>) => Promise<SignUpResult>
      }
    | {
        // Props para login
        type: "sign-in"
      }
  )

/** Formulário de autenticação. */
export default function AuthForm({ type, className, ...props }: Props) {
  const router = useRouter() // Hook de navegação do Next.js

  /** Se o formulário é de cadastro. */
  const isSignUp = type === "sign-up"
  /** Zod schema para validação do formulário. */
  const authSchema = isSignUp ? signUpSchema : signInSchema

  /** Definição do formulário. */
  const form = useForm<FormData>({
    resolver: zodResolver(authSchema), // usar zod para validação
    // Valores padrão (vazios) do form
    defaultValues: isSignUp ? { firstName: "", lastName: "", email: "", password: "", role: undefined } : { email: "", password: "" },
  })

  /** Observador do campo "role". */
  const watchedRole = useWatch({
    control: form.control,
    name: "role",
  })

  /** Função executada ao submeter o formulário. */
  const handleSubmit: SubmitHandler<FormData> = async (data) => {
    try {
      if (isSignUp) {
        // Cadastro
        const result = await signUpUser(data as SignUpInput)

        if (result.success) {
          // Cadastro bem-sucedido
          toast.success(AUTH_TEXTS.signUpSuccess) // notificação
          form.reset() // limpar form
        } else {
          throw result.message // Problema no cadastro
        }
      } else {
        // Login
        const result = await signInUser(data as SignInInput)

        if (result.success) {
          // Login bem-sucedido
          toast.success(AUTH_TEXTS.signInSuccess) // notificação
          router.push(ROUTES.dashboard) // redirecionamento
        } else {
          throw result.message // Problema no login
        }
      }
    } catch (error) {
      // Mensagem de erro
      toast.error(AUTH_TEXTS.errorTitle, { description: error instanceof Error ? error.message : String(error) })
    }
  }

  return (
    <Form {...form}>
      <form
        onSubmit={form.handleSubmit(handleSubmit)} // função para lidar com o envio
        className={cn("", className)}
        {...props}
      >
        <FieldGroup>
          {/* Header */}
          <AuthFormHeader />

          {/* Campo E-mail */}
          <FormField
            control={form.control}
            name="email"
            render={({ field }) => (
              <FormItem>
                <FormLabel>{AUTH_TEXTS.email}</FormLabel>
                <FormControl>
                  <Input type="email" placeholder={AUTH_TEXTS.emailFormat} autoComplete="email" {...field} />
                </FormControl>
                <FormMessage />
              </FormItem>
            )}
          />

          {/* Campo Senha */}

          <FormField
            control={form.control}
            name="password"
            render={({ field }) => (
              <FormItem>
                <div className="flex items-center">
                  <FormLabel>{AUTH_TEXTS.password}</FormLabel>
                  {/* Botão de esqueceu a senha */}
                  <Button type="button" variant="link" className="ml-auto text-sm py-0 h-fit">
                    {AUTH_TEXTS.forgotPassword}
                  </Button>
                </div>
                <FormControl>
                  {
                    // TODO: criar componente de senha com botão de mostrar/ocultar
                  }
                  <Input type="password" placeholder="********" autoComplete="current-password" {...field} />
                </FormControl>
                <FormMessage />
              </FormItem>
            )}
          />

          {/* Botão de enviar */}
          <Button size="lg" type="submit" disabled={form.formState.isSubmitting}>
            {form.formState.isSubmitting && <LoaderCircle className="animate-spin" />} {/* Ícone de carregamento */}
            {isSignUp ? AUTH_TEXTS.signUpSubmit : AUTH_TEXTS.loginSubmit}
          </Button>
        </FieldGroup>
      </form>
    </Form>
  )
}

/** Cabeçalho do formulário de autenticação. */
function AuthFormHeader() {
  return (
    <header className="flex flex-col items-center gap-2 text-center">
      <h1 className="text-2xl font-bold">{AUTH_TEXTS.loginTitle}</h1>
      <p className="text-muted-foreground text-balance">{AUTH_TEXTS.loginSubtitle}</p>
    </header>
  )
}
