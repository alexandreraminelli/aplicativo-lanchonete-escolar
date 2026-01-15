"use client"

import PasswordInput from "@/components/common/inputs/PasswordInput"
import { Button } from "@/components/ui/button"
import { FieldGroup } from "@/components/ui/field"
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form"
import { Input } from "@/components/ui/input"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { ICONS } from "@/constants/icons"
import { ROUTES } from "@/constants/navigation/routes"
import { AUTH_TEXTS } from "@/constants/texts/auth.texts"
import { signInUser } from "@/lib/firebase/auth/auth"
import { SignInInput, SignUpInput } from "@/lib/firebase/auth/authInput.types"
import { createUser } from "@/lib/firebase/functions/users.functions"
import { cn } from "@/lib/utils"
import { USER_ROLES } from "@/types/users/user.types"
import { signInSchema, signUpSchema } from "@/utils/validation/schemas/authSchema"
import { zodResolver } from "@hookform/resolvers/zod"
import { HugeiconsIcon } from "@hugeicons/react"
import { type ClassValue } from "clsx"
import Link from "next/link"
import { useRouter } from "next/navigation"
import { SubmitHandler, useForm, useWatch } from "react-hook-form"
import { toast } from "sonner"
import z from "zod"

/** Tipagem dos dados do form de criar conta. */
type SignUpFormData = z.infer<typeof signUpSchema>
/** Tipagem dos dados do form de login. */
type SignInFormData = z.infer<typeof signInSchema>
/** Tipagem do formulário (Union Type). */
type FormData = SignUpFormData | SignInFormData

/** Props para o `AuthForm`. */
interface Props {
  /** Tipo de formulário: criar conta ou login. */
  mode: "sign-up" | "sign-in"
  /** Classes CSS adicionais. */
  className?: ClassValue
}

/** Formulário de autenticação. */
export default function AuthForm({ mode: type, className, ...props }: Props) {
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
        const result = await createUser(data as SignUpInput)

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
          router.push(ROUTES.home) // redirecionamento
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
          {/* Campo Nome */}
          {isSignUp && (
            <FormField
              control={form.control}
              name="firstName"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>{AUTH_TEXTS.firstName}</FormLabel>
                  <FormControl>
                    <Input type="text" autoComplete="name" {...field} />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
          )}

          {/* Campo sobrenome */}
          {isSignUp && (
            <FormField
              control={form.control}
              name="lastName"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>{AUTH_TEXTS.lastName}</FormLabel>
                  <FormControl>
                    <Input type="text" autoComplete="family-name" {...field} />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
          )}

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
                <div className="flex items-center justify-between">
                  <FormLabel>{AUTH_TEXTS.password}</FormLabel>

                  {/* Botão de esqueceu a senha */}
                  {!isSignUp && <ForgotPasswordButton />}
                </div>
                <FormControl>
                  <PasswordInput isSignUp={isSignUp} {...field} />
                </FormControl>
                <FormMessage />
              </FormItem>
            )}
          />

          {/* Tipo de Usuário */}
          {isSignUp && (
            <FormField
              control={form.control}
              name="role"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>{AUTH_TEXTS.role}</FormLabel>
                  <Select value={field.value} onValueChange={field.onChange}>
                    <SelectTrigger className="w-full">
                      <SelectValue placeholder={AUTH_TEXTS.role} />
                    </SelectTrigger>
                    <SelectContent>
                      {USER_ROLES.map((role) => (
                        <SelectItem key={role} value={role}>
                          {AUTH_TEXTS.roles[role]}
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                  <FormMessage />
                </FormItem>
              )}
            />
          )}

          {/* Botão de enviar */}
          <Button size="lg" type="submit" disabled={form.formState.isSubmitting}>
            {form.formState.isSubmitting && <HugeiconsIcon icon={ICONS.actions.loading} className="animate-spin" />} {/* Ícone de carregamento */}
            {/* Ícone + Texto */}
            <HugeiconsIcon icon={ICONS.auth.login} />
            {isSignUp ? AUTH_TEXTS.signUpSubmit : AUTH_TEXTS.loginSubmit}
          </Button>
        </FieldGroup>
      </form>
    </Form>
  )
}

/** Botão de Esqueci a Senha. */
function ForgotPasswordButton() {
  return (
    <Button type="button" variant="link" className="text-sm p-0 h-fit">
      <Link href={ROUTES.forgotPassword}>{AUTH_TEXTS.forgotPassword}</Link>
    </Button>
  )
}
